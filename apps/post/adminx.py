import xadmin
from xadmin.layout import Main, Fieldset, Row
# from crispy_forms.bootstrap import InlineCheckboxes

from .models import Author, Article


class AuthorAdmin(object):
    list_display = ['name', 'profile']
    model_icon = 'fa fa-pencil'


class ArticleAdmin(object):
    list_display = ['title', 'author', 'category', 'view_num_count', 'is_new', 'is_published', 'is_recommend', 'created_time', 'modified_time']
    # 文章编辑页面排版
    # 下列设置只在admin中起作用不在adminx中起作用
    # fieldset = (
    #     ("文章信息", {'fields': ['title', 'author', 'category', 'excerpt']}),
    #     ("文章状态", {'fields': ['is_published', 'is_new', 'is_recommend']}),
    #     ("内容", {'fields': ['content']})
    # )
    # # fields = ['is_published', 'is_new', 'is_recommend']
    form_layout = (
        Main(
            Fieldset('文章基本信息',
                     'title', 'author', 'category', 'user'
                     ),
            Fieldset('文章状态',
                     'is_new', 'is_published', 'is_recommend',
                     # css_class='col col-sm-12'
                     ),
            Fieldset('文章内容',
                     'excerpt', 'content',
                     ),
            css_class='col col-sm-12',
        ),
        # Side(
        #     Fieldset('文章状态',
        #              'is_published', 'is_new', 'is_recommend',
        #              ),
        # )
    )
    search_fields = ['title', 'author', 'category']
    list_filter = ['title', 'author', 'category', 'created_time', 'modified_time']
    # 每一页显示20篇文章
    list_per_page = 20

    model_icon = 'fa fa-book'
    style_fields = {'content': 'ueditor'}
    import_excel = True

    def view_num_count(self, obj):
        """自定义显示字段"""
        return sum(map(lambda x: x.view_num, obj.view_num.all()))

    def post(self, request, *args, **kwargs):
        if 'excel' in request.FILES:
            pass
        return super(ArticleAdmin, self).post(request, args, kwargs)

xadmin.site.register(Author, AuthorAdmin)
xadmin.site.register(Article, ArticleAdmin)