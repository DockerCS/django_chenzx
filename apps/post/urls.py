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

from .views import IndexView, ArticleDetailView

app_name = 'post'
urlpatterns = [
    url(r'^$', IndexView.as_view(), name='index'),
    url(r'^(?P<article_id>[0-9]+)/$', ArticleDetailView.as_view(), name='articledetail'),  # id为文章模型Article的主键，?P<id>[0-9]+用来传递前端的参数id到后端。
]
