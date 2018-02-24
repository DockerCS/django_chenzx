"""czxblog URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
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
from tools.views.likes import LikeView
from tools.views.favorite import AddFavoriteView

urlpatterns = [
    url(r'^like/$', LikeView.as_view(), name='addlike'),  # 点赞
    url(r'^favorite/$', AddFavoriteView.as_view(), name='addfavorite'),  # 收藏，类函数作为url，一定的转化成函数加上as_view()
]
