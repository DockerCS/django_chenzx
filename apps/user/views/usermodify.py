import json

from django.shortcuts import render
from django.http import HttpResponse
from django.views.generic.base import View

from ..models import UserProfile, EmailVerifyRecord
from ..forms import ForgetPwdForm, ResetPwdForm
from tools.views.email import send_email


# 忘记密码，就发送邮件去验证
class ForgetPwdView(View):
    def get(self, request):
        # forgetpwdform = ForgetPwdForm()
        return render(request, 'user/forgetpwd.html', {})

    def post(self, request):
        forgetpwdform = ForgetPwdForm(request.POST)
        if forgetpwdform.is_valid():
            email = request.POST.get('email')

            if UserProfile.objects.filter(email=email):
                send_email(email, 'forget')
                return render(request, 'message.html', {'forgetpwdform': forgetpwdform, 'msg': '重置密码链接已经发送到您的邮箱，请注意查收'})
            else:
                # 没有注册则不发送重置密码链接
                return render(request, 'user/forgetpwd.html', {'forgetpwdform': forgetpwdform, 'msg': '该用户未注册'})
        else:
            return render(request, 'user/forgetpwd.html', {'forgetpwdform': forgetpwdform})


# 重设密码
class ResetPwdView(View):
    """
    忘记密码，通过发邮件修改密码
    """
    def get(self, request, active_code):
        all_records = EmailVerifyRecord.objects.filter(code=active_code)
        if all_records:
            for record in all_records:
                email = record.email
                return render(request, 'user/resetpwd.html', {'email': email})
        else:
            return render(request, 'message.html', {'msg': '重置密码链接已经失效，请重新发送！'})  # 重置密码链接失效或者激活失败
        return render(request, 'user/forgetpwd.html', {'msg': '验证码不存在，请重新发送！'})

    def post(self, request):
        resetpwdform = ResetPwdForm(request.POST)
        if resetpwdform.is_valid():
            pwd1 = request.POST.get('password1')
            pwd2 = request.POST.get('password2')
            email = request.POST.get('email')

            if pwd1 != pwd2:
                return render(request, 'user/resetpwd.html', {'msg': '密码不一致', 'email': email})

            user = UserProfile.objects.get(email=email)
            user.set_password(pwd1)
            user.save()
            return render(request, 'user/login.html', {'msg': '密码修改成功，请登录'})
        else:
            email = request.POST.get('email')  # 如果form无效还是需要把email返回前端，以便再次输入
            return render(request, 'user/resetpwd.html', {'resetpwdform': resetpwdform, 'email': email})



