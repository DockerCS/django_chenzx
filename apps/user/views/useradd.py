import json

from django.shortcuts import render, HttpResponseRedirect
from django.http import HttpResponse
from django.views.generic.base import View
from django.contrib.auth import login, logout, authenticate
from django.contrib.auth.backends import ModelBackend
from django.db.models import Q  # Q代表联合查询
from django.contrib.auth.hashers import make_password

from ..models import UserProfile, EmailVerifyRecord
from ..forms import LoginForm, RegisterForm
from tools.views.email import send_email


# 邮箱和用户名登录
class CustomBackend(ModelBackend):
    def authenticate(self, username=None, password=None, **kwargs):
        try:
            user = UserProfile.objects.get(Q(username=username) | Q(email=username))
            if user.check_password(password):
                return user
        except Exception as e:
            return None


# 发送邮件激活用户
class ActiveView(View):
    def get(self, request, active_code):
        all_records = EmailVerifyRecord.objects.filter(code=active_code)
        if all_records:
            for record in all_records:
                email = record.email
                # 不设置验证码失效
                # sendtime = time.mktime(record.sendtime.timetuple())
                # current_time = time.time()
                user = UserProfile.objects.get(email=email)
                user.is_active = True
                user.save()
        else:
            return render(request, 'message.html', {'msg': '激活链接已经失效，请重新注册！'})  # 激活链接失效或者激活失败
        return render(request, 'user/login.html', {'msg': '账户已激活，请登录'})


# 登录
class LoginView(View):
    def get(self, request):
        # get 请求中，next 通过 url 传递，即 /?next=value
        redirect_to = request.GET.get('next', request.GET.get('next', '/'))
        return render(request, 'user/login.html', {'next': redirect_to})

    def post(self, request):
        # post 请求中，next 通过表单传递，即 <input type="hidden" name="next" value="{{ next }}"/>
        # 如果没有next，则默认值为'/'，也就是跳转到首页
        redirect_to = request.POST.get('next', request.GET.get('next', '/'))
        loginform = LoginForm(request.POST)  # 实例化
        # 第一步判断form是否有效，然后判断用户是否存在并激活
        if loginform.is_valid():
            # username = request.POST.get('username')
            username = loginform.cleaned_data['username']
            password = request.POST.get('password')
            # password = loginform.cleaned_data['password']
            user = authenticate(username=username, password=password)  # password 是加密过的？，authenticate只支持username验证

            if user is not None:
                if user.is_active:
                    login(request, user)
                    # response['success'] = True
                    # return HttpResponse(json.dumps(response), content_type='application/json')
                    return HttpResponseRedirect(redirect_to)
                else:
                    return render(request, 'user/login.html', {'loginform': loginform, 'msg': '该用户未激活'})
            else:
                return render(request, 'user/login.html', {'loginform': loginform, 'msg': '用户名或密码错误', 'next': redirect_to})

        else:
            return render(request, 'user/login.html', {'loginform': loginform, 'next': redirect_to})


# 注册
class RegisterView(View):
    def get(self, request):
        return render(request, 'user/register.html', {})

    def post(self, request):
        registerform = RegisterForm(request.POST)
        if registerform.is_valid():
            username = request.POST.get('username')
            email = request.POST.get('email')

            if UserProfile.objects.filter(username=username):
                # 'registerform': registerform是用来返回前端的验证码, 判断用户名是否存在
                return render(request, 'user/register.html', {'registerform': registerform, 'msg': '该用户名已注册'})
            elif UserProfile.objects.filter(email=email):
                # 判断邮箱是否存在
                return render(request, 'user/register.html', {'registerform': registerform, 'msg': '该邮箱已注册'})

            password = request.POST.get('password')
            userprofile = UserProfile(username=username, nickname=username, email=email)
            # userprofile.password = make_password(password)
            userprofile.is_active = False
            userprofile.set_password(password)
            userprofile.save()

            send_email(email, 'register')
            return render(request, 'message.html', {'msg': '注册成功，请激活后登录'})

        else:
            return render(request, 'user/register.html', {'registerform': registerform})


# 退出
class LogoutView(View):
    def get(self, request):
        logout(request)
        # returnPath = request.META.get('HTTP_REFERER', '/')
        # get 请求中，next 通过 url 传递，即 /?next=value
        redirect_to = request.GET.get('next', request.GET.get('next', '/'))
        return HttpResponseRedirect(redirect_to)
