import xadmin

from .models import PersonalProfile, GuesBook, MyPicture, Photo


class PersonalProfileAdmin(object):
    list_display = ['title', 'profile', 'created_time']

    style_fields = {'profile': 'ueditor'}  # 字段在xadmin后台为ueditor样式
    # model_icon = ''


class GuesBookAdmin(object):
    list_display = ['title', 'content', 'created_time']

    style_fields = {'content': 'ueditor'}  # 字段在xadmin后台为ueditor样式
    # model_icon = ''


class MyPictureAdmin(object):
    list_display = ['title', 'mypicture_cover', 'created_time']


class PhotoAdmin(object):
    list_display = ['title', 'mypicture', 'photo', 'created_time']


xadmin.site.register(PersonalProfile, PersonalProfileAdmin)
xadmin.site.register(GuesBook, GuesBookAdmin)
xadmin.site.register(MyPicture, MyPictureAdmin)
xadmin.site.register(Photo, PhotoAdmin)
