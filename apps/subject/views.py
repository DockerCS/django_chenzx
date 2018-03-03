from django.shortcuts import render
from django.views.generic import View

from .models import Subject, SubjectBanner
from tools.decorator.views_decorator import record_view


class SubjectListView(View):
    """专题列表"""
    def get(self, request):
        subjects = Subject.objects.all()

        data = {}
        data['subjects'] = subjects
        return render(request, 'subject/subject.html', data)


class SubjectDetailView(View):
    """专题详情"""
    @record_view(Subject)
    def get(self, request, id):
        subject = Subject.objects.get(id=id)
        chapters = []

        # 数据统计
        post_num = 0
        tutorial_num = 0

        # 遍历章节
        for i, chapter in enumerate(subject.subjectchapter_set.all()):
            # 遍历子项
            items = []
            for item in chapter.subjectitem_set.all():
                obj = item.content_type.get_object_for_this_type(id=item.object_id)
                obj_type = item.content_type.model

                # 根据类型不同，设置名称和链接（动态绑定属性）
                if obj_type == 'article':
                    item.type_name = '博客'
                    item.id = item.object_id
                    item.title = obj.title
                    post_num += 1
                elif obj_type == 'tutorial':
                    item.type_name = '教程'
                    item.id = item.object_id
                    item.title = obj.title
                    tutorial_num += 1
                else:
                    item.type_name = '未知'
                    item.url = '/'
                    item.title = '<未知的类型>'
                items.append(item)

            chapter.items = items
            chapter.sort_num = i + 1
            chapters.append(chapter)

        data = {}
        data['subject'] = subject
        data['chapters'] = chapters
        data['count'] = u'该专题分%s章节，共%s篇博客、%s个教程' % (len(chapters), post_num, tutorial_num)

        return render(request, 'subject/subject_detail_page.html', data)


# class BannerView(View):
#     """轮播图"""
#     def get(self, request):
#         banners = SubjectBanner.objects.order_by('?')[:5]  # 取轮播图任意五条
#
#         data = {}
#         data['banners'] = banners
#         return render(request, 'subject/banner.html', data)


