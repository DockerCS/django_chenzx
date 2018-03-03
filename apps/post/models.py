import markdown
from django.utils.html import strip_tags
from django.db import models
from django.urls import reverse
from django.contrib.contenttypes.fields import GenericRelation

from DjangoUeditor.models import UEditorField
from user.models import UserProfile
from tools.models import ViewNum
from category.models import Category


# 博客的管理器
class PostManager(models.Manager):
    def query_by_author(self, author_id):
        author = Author.objects.get(id=author_id)
        post_list = author.post_set.all()
        return post_list

    def query_by_category(self, category_id):
        query = self.get_queryset().filter(category_id=category_id)
        return query

    def query_by_time(self):
        query = self.get_queryset().order_by('-created_time')
        return query


# 博客作者
class Author(models.Model):
    name = models.CharField(max_length=50, verbose_name='作者姓名')
    profile = models.CharField(max_length=300, verbose_name='作者介绍')

    class Meta:
        verbose_name = '作者'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name


# 博客数据模型
class Article(models.Model):
    title = models.CharField(max_length=100, verbose_name='标题')
    author = models.ForeignKey(Author, verbose_name='作者')
    user = models.ManyToManyField(UserProfile, blank=True, verbose_name='用户')
    category = models.ForeignKey(Category, verbose_name='分类')
    excerpt = models.CharField(max_length=300, null=True, blank=True, verbose_name='文章摘要')
    content = UEditorField(verbose_name='内容', height=500, width=1050,
                           default='', blank=True, imagePath='uploads/images/',
                           filePath='uploads/files/')  # 由于存在数据，所以要默认为空, 状态栏精简toolbars='besttome'
    is_published = models.BooleanField(default=False, verbose_name='是否发表')
    is_new = models.BooleanField(default=False, verbose_name='最新文章')
    is_recommend = models.BooleanField(default=False, verbose_name='是否推荐')
    created_time = models.DateTimeField(auto_now_add=True, verbose_name='文章添加时间')
    modified_time = models.DateTimeField(auto_now=True, verbose_name='文章修改时间')
    view_num = GenericRelation(ViewNum)  # 文章的阅读计数

    # objects = PostManager()

    def save(self, *args, **kwargs):
        # 如果没有填写摘要
        if not self.excerpt:
            # 实例化一个Markdown类，用于渲染article.content文本
            md = markdown.Markdown(extensions=['markdown.extensions.extra', 'markdown.extensions.codehilite'])
            """
            先将Markdown文本渲染成HTML文本，strip_tags去掉HTML文本的全部 HTML 标签
            从文本摘取前54个字符赋给excerpt
            """
            self.excerpt = strip_tags(md.convert(self.content))[:160]  # 展示文章内容的前54个字

        # 调用父类save方法将摘要储存到数据库中
        super(Article, self).save(*args, **kwargs)

    class Meta:
        verbose_name = '个人博客'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.title

    def get_absolute_url(self):
        return reverse('post:articledetail', kwargs={'id': self.pk})


