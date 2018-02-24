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
from django.conf.urls import url, include
# from django.views.static import serve
import xadmin

from post.views import IndexView
# from django_chenzx.settings import MEDIA_ROOT, STATIC_ROOT


urlpatterns = [
    url(r'^$', IndexView.as_view(), name='index'),
    url(r'^index/$', IndexView.as_view(), name='index'),
    url(r'^xadmin/', xadmin.site.urls),
    url(r'^search/', include('haystack.urls')),  # 搜索引擎
    url(r'^ueditor/', include('DjangoUeditor.urls')),  # 百度富文本urls
    # url(r'^captcha/', include('captcha.urls')),  # 图片验证码
    url(r'^user/', include('user.urls')),  # 用户urls
    url(r'^post/', include('post.urls')),  # 博客urls
    url(r'^category/', include('category.urls')),  # 博客分类rls
    url(r'^me/', include('me.urls')),  # 关于我
    url(r'^tools/', include('tools.urls')),  # 关于我

    # 评论
    url(r'^comments/', include('django_comments_xtd.urls')),

    # 第三方登录url
    url('', include('social_django.urls', namespace='social')),

    # 消息通知
    url(r'^notifications/', include('notifications.urls')),

    # 配置上传文件的访问函数，debug=False的时候
    # url(r'^static/(?P<path>.*)$', serve, {"document_root": STATIC_ROOT}),
    # url(r'^media/(?P<path>.*)$', serve, {"document_root": MEDIA_ROOT}),
]

# 全局404页面，名称是固定的
handler404 = 'user.views.404or500.page_not_found'
handler500 = 'user.views.404or500.page_error'
