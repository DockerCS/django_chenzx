# coding:utf-8
from django.shortcuts import render, get_object_or_404
from django.views.generic import View

from .models import PersonalProfile, GuesBook, MyPicture, Photo
from tools.views.paginate import getPages
from tools.decorator.views_decorator import record_view_aboutme


class PersonalProfileView(View):
    """
    关于我
    """
    @record_view_aboutme(PersonalProfile)
    def get(self, request):
        data = {}
        data['myinfo'] = PersonalProfile.objects.all()
        # 返回 /me/aboutme.html页面
        return render(request, 'me/aboutme.html', data)


class MyPictureView(View):
    """
    个人相册
    """
    def get(self, request):
        mypicture_list = MyPicture.objects.all()

        data = {}
        data['mypicture_list'] = mypicture_list
        # 返回 /me/mypicture.html页面
        return render(request, 'me/mypicture.html', data)


class PhotoView(View):
    """
    个人相册排版
    """
    def get(self, request, mypicture_id):
        photo_list = Photo.objects.query_by_mypicture(mypicture_id)
        pages, photo_list = getPages(request, photo_list, 20)

        data = {}
        data['picture'] = MyPicture.objects.get(id=mypicture_id)
        data['photo_list'] = photo_list
        data['pages'] = pages
        return render(request, 'me/photo.html', data)


# class PhotoDetailView(View):
#     """
#     个人相册详情页
#     """
#     def get(self, request, mypicture_id):
#         photo_list = Photo.objects.query_by_category(mypicture_id)
#         pages, article_category_list = getPages(request, article_category_list)
#
#         data = {}
#         data['photo_list'] = photo_list
#         # data['pages'] = pages
#         return render(request, 'me/photo.html', data)


class GuestBookView(View):
    """
    留言簿
    """
    def get(self, request):
        data = {}
        data['guestbook'] = get_object_or_404(GuesBook, id=1)
        return render(request, 'me/guestbook.html', data)
