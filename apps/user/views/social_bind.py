# -*- coding: utf-8 -*-
from django.shortcuts import render, HttpResponseRedirect
from django.views.generic.base import View
from django.contrib.auth import login, logout, authenticate
from django.contrib.auth.hashers import make_password

from user.models import UserProfile
from user.forms import SocialBindForm


class SocialBindView(View):
    def get(self, request):
        # get 请求中，next 通过 url 传递，即 /?next=value
        redirect_to = request.GET.get('next', request.GET.get('next', '/'))
        user = request.user
        if user.email:
            return HttpResponseRedirect('/')
        else:
            logout(request)  # 如果没有绑定就不让登录，这里设置登出，就会让post的时候没法得到request.user!???怎么解决？
            # 账户的用户名传入前端，绑定过程得到该用户，这样再进行绑定，由于上一步做了退出，故而绑定失败或者没有绑定就不会有登录
            return render(request, 'user/social_bind.html', {'user': user})

    def post(self, request):
        # post 请求中，next 通过表单传递，即 <input type="hidden" name="next" value="{{ next }}"/>
        # 如果没有next，则默认值为'/'，也就是跳转到首页
        redirect_to = request.POST.get('next', request.GET.get('next', '/'))
        # post一开始就得到用户，等返回错误的时候就把用户返回前端
        user = request.POST.get('user')
        socialbindform = SocialBindForm(request.POST)
        if socialbindform.is_valid():
            username = request.POST.get('username')
            email = request.POST.get('email')
            password = request.POST.get('password')

            if UserProfile.objects.filter(username=username):
                # 判断用户名是否存在
                return render(request, 'user/social_bind.html', {'socialbindform': socialbindform, 'msg': '该用户名已注册', 'user': user})
            elif UserProfile.objects.filter(email=email):
                # 判断邮箱是否存在
                return render(request, 'user/social_bind.html', {'socialbindform': socialbindform, 'msg': '该邮箱已注册', 'user': user})

            user = UserProfile.objects.get(username=request.POST.get('user'))  # 得到get时候传入的用户名
            user.username = username
            user.nickname = username
            user.email = email
            user.password = make_password(password)
            user.save()
            # 绑定成功后，登录用户
            user = authenticate(username=username, password=password)
            if user is not None:
                login(request, user)

            return HttpResponseRedirect('/')

        else:
            return render(request, 'user/social_bind.html', {'socialbindform': socialbindform, 'user': user})


