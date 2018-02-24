from django import forms
# from captcha.fields import CaptchaField

from .models import UserProfile


# 登录表单
class LoginForm(forms.Form):
    username = forms.CharField(required=True, error_messages={'required': "用户名不能为空"})
    password = forms.CharField(required=True, min_length=6, error_messages={'required': "密码不能为空"})


# 注册表单
class RegisterForm(forms.Form):
    username = forms.CharField(required=True, error_messages={'required': "用户名不能为空"})
    email = forms.EmailField(required=True, error_messages={'required': "邮箱不能为空"})
    password = forms.CharField(required=True, min_length=6, error_messages={'required': "密码不能为空"})
    # captcha = CaptchaField(error_messages={'invalid': "验证码错误"})  # 注册中的图片验证码


# 第三方用户绑定
class SocialBindForm(forms.Form):
    username = forms.CharField(required=True, error_messages={'required': "用户名不能为空"})
    email = forms.EmailField(required=True, error_messages={'required': "邮箱不能为空"})
    password = forms.CharField(required=True, min_length=6, error_messages={'required': "密码不能为空"})


# 忘记密码表单
class ForgetPwdForm(forms.Form):
    email = forms.EmailField(required=True, error_messages={'required': "请输入您注册的邮箱"})


# 忘记密码后，修改密码
class ResetPwdForm(forms.Form):
    password1 = forms.CharField(required=True, min_length=6, error_messages={'required': "密码不能为空"})
    password2 = forms.CharField(required=True, min_length=6, error_messages={'required': "密码不能为空"})


# 用户头像上传
class UploadAvataForm(forms.ModelForm):
    class Meta:
        model = UserProfile
        fields = ['avatar']


# 用户个人信息
class UserInfoForm(forms.ModelForm):
    class Meta:
        model = UserProfile
        fields = ['nickname', 'gender', 'address', 'birthday', 'mobile']


# 用户中心修改密码
class ModifyPwdForm(forms.Form):
    password1 = forms.CharField(required=True, min_length=6, error_messages={'required': "密码不能为空"})
    password2 = forms.CharField(required=True, min_length=6, error_messages={'required': "密码不能为空"})