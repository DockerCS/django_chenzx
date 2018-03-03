import xadmin

from .models import SubjectType, SubjectStaticType, Subject, SubjectChapter, SubjectItem, SubjectBanner


class SubjectTypeAdmin(object):
    list_display = ('id', 'title', 'created_time')


class SubjectStaticTypeAdmin(object):
    list_display = ('id', 'title', 'created_time')


# Subject部分
class SubjectChapterInline(object):
    model = SubjectChapter
    extra = 3


class SubjectAdmin(object):
    list_display = ('title', 'profile', 'static', 'created_time', 'modified_time')
    inlines = [SubjectChapterInline, ]


# Subject章节
class SubjectItemInline(object):
    model = SubjectItem
    extra = 3


class SubjectChapterAdmin(object):
    list_display = ('subject', 'title', 'created_time')
    inlines = [SubjectItemInline, ]


class SubjectBannerAdmin(object):
    list_display = ('subject', 'image', 'created_time')


xadmin.site.register(SubjectType, SubjectTypeAdmin)
xadmin.site.register(SubjectStaticType, SubjectStaticTypeAdmin)
xadmin.site.register(Subject, SubjectAdmin)
xadmin.site.register(SubjectChapter, SubjectChapterAdmin)
xadmin.site.register(SubjectBanner, SubjectBannerAdmin)