"""django_chenzx URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.10/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url

from .views.useradd import LoginView, RegisterView, ActiveView, LogoutView
from .views.usermodify import ForgetPwdView, ResetPwdView
from .views.userinfo import UserInfoView, UploadAvatarView, ModifyPwdView, SendEmailCodeView, ResetEmailView, MyFavArticleView, MyFavTopicView, UserMessageView, UserCommentView
from .views.changyan import get_user_info
from .views.social_bind import SocialBindView


urlpatterns = [
    url('^active/(?P<active_code>.*)/$', ActiveView.as_view(), name='active'),  # 激活链接
    url('^login/$', LoginView.as_view(), name='login'),  # 登录
    url('^register/$', RegisterView.as_view(), name='register'),  # 注册
    url('^logout/$', LogoutView.as_view(), name='logout'),  # 退出账户

    # 畅言单点登录
    url('^changyan/getuserinfo/$', get_user_info, name='changyan'),  # 畅言单点登录

    # 第三方登录绑定
    url('^social_bind/$', SocialBindView.as_view(), name='social_bind'),

    url('^forgetpwd/$', ForgetPwdView.as_view(), name='forgetpwd'),  # 忘记密码
    url('^resetpwd/(?P<active_code>.*)/$', ResetPwdView.as_view(), name='resetpwd'),  # 重设密码
    url('^resetpassword/$', ResetPwdView.as_view(), name='resetpassword'),  # 重设密码
    
    url('^userinfo/$', UserInfoView.as_view(), name='userinfo'),  # 用户中心/信息
    url('^uploadavatar/$', UploadAvatarView.as_view(), name='uploadavatar'),  # 用户上传头像
    url('^modifypwd/$', ModifyPwdView.as_view(), name='modifypwd'),  # 用户中心修改密码
    url('^sendemailcode/$', SendEmailCodeView.as_view(), name='sendemailcode'),  # 用户中心修改登陆邮箱时发送邮箱验证码
    url('^resetemail/$', ResetEmailView.as_view(), name='resetemail'),  # 用户中心修改登陆邮箱

    url('^myfavarticle/$', MyFavArticleView.as_view(), name='myfavarticle'),  # 用户收藏的文章
    url('^myfavtopic/$', MyFavTopicView.as_view(), name='myfavtopic'),  # 用户收藏的专题
    url('^usermessage/$', UserMessageView.as_view(), name='usermessage'),  # 用户消息
    url('^usercomment/$', UserCommentView.as_view(), name='usercomment'),  # 用户评论
]
