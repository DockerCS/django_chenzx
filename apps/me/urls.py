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

from .views import PersonalProfileView, GuestBookView, MyPictureView, PhotoView


app_name = 'me'
urlpatterns = [
    url(r'^mypicture/$', MyPictureView.as_view(), name='mypicture'),  # 我的相册
    url(r'^picture/(?P<mypicture_id>[0-9]+)/$', PhotoView.as_view(), name='picture'),  # 相册照片
    # url(r'^myphoto/$', Photo.as_view(), name='myphoto'),  # 我的相册照片详情页
    url(r'^personalprofile/$', PersonalProfileView.as_view(), name='personalprofile'),  # 关于我，我的介绍
    url(r'^guestbook/$', GuestBookView.as_view(), name='guestbook'),  # 留言簿
]
