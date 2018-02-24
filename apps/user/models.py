from django.db import models
from django.contrib.auth.models import AbstractUser


# 用户信息
class UserProfile(AbstractUser):
    nickname = models.CharField(max_length=50, verbose_name='昵称', default="")
    gender = models.CharField(choices=(("male", '男'), ("female", '女')), verbose_name='性别', default="male", max_length=6)
    birthday = models.DateField(null=True, blank=True, verbose_name='生日')
    address = models.CharField(max_length=100, default='火星的地球驻点')
    mobile = models.CharField(max_length=11, null=True, blank=True, verbose_name='电话')
    avatar = models.ImageField(upload_to="image/avatar", default=u'image/avatar/you.png', max_length=200, verbose_name='头像')

    class Meta:
        verbose_name = "用户信息"
        verbose_name_plural = verbose_name  # 加上之后admin后台会去除复数形式

    def __str__(self):
        return self.username  # 继承的AbstractUser含有username

# 邮箱验证码
class EmailVerifyRecord(models.Model):
    code = models.CharField(max_length=20, verbose_name='验证码')
    email = models.EmailField(max_length=50, verbose_name='邮箱')
    sendtype = models.CharField(choices=(("register", "注册"), ("forget", "找回密码"), ("resetemail", "修改邮箱")), max_length=10, verbose_name='验证码类型')
    sendtime = models.DateTimeField(auto_now_add=True, verbose_name='发送时间')

    class Meta:
        verbose_name = '邮箱验证码'
        verbose_name_plural = verbose_name

    def __str__(self):
        return '{0}({1})'.format(self.code, self.email)
