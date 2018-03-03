from django.db import models
from django.urls import reverse
from django.contrib.contenttypes.models import ContentType
from django.contrib.contenttypes.fields import GenericForeignKey

from post.models import Author


class SubjectType(models.Model):
    """专题类别"""
    title = models.CharField(max_length=20, verbose_name='名称')
    created_time = models.DateTimeField(auto_now_add=True, verbose_name='添加时间')

    class Meta:
        verbose_name = '专题类别'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.title


class SubjectStaticType(models.Model):
    """专题状态"""
    title = models.CharField(max_length=15, verbose_name='名称')
    created_time = models.DateTimeField(auto_now_add=True, verbose_name='添加时间')

    class Meta:
        verbose_name = '专题状态'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.title


class Subject(models.Model):
    """专题"""
    title = models.CharField(max_length=20, verbose_name='名称')
    profile = models.CharField(max_length=300, verbose_name='简介')
    image = models.ImageField(max_length=200, upload_to='image/subject', verbose_name='图片', null=True, blank=True)

    author = models.ForeignKey(Author, verbose_name='作者')
    static = models.ForeignKey(SubjectStaticType, verbose_name='状态')
    type = models.ForeignKey(SubjectType, verbose_name='分类')

    created_time = models.DateTimeField(auto_now_add=True, verbose_name='添加时间')
    modified_time = models.DateTimeField(auto_now=True, verbose_name='修改时间')

    class Meta:
        verbose_name = '专题'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.title

    def get_absolute_url(self):
        return reverse('subject:subjectdetail', kwargs={'id': self.pk})


class SubjectChapter(models.Model):
    """专题章节"""
    title = models.CharField(max_length=20, verbose_name='章节名称')
    subject = models.ForeignKey(Subject, verbose_name='专题')
    created_time = models.DateTimeField(auto_now_add=True)

    class Meta:
        verbose_name = '专题章节'
        verbose_name_plural = verbose_name

    def __str__(self):
        return u'<%s-%s>' % (self.title, self.subject)


class SubjectItem(models.Model):
    """专题明细"""
    chapter = models.ForeignKey(SubjectChapter, default=1)

    content_type = models.ForeignKey(ContentType, verbose_name='类型')
    object_id = models.PositiveIntegerField(verbose_name='id')
    content_object = GenericForeignKey(
        ct_field="content_type",
        fk_field="object_id"
    )

    created_time = models.DateTimeField(auto_now_add=True, verbose_name='添加时间')
    modified_time = models.DateTimeField(auto_now=True, verbose_name='修改时间')

    class Meta:
        verbose_name = '专题明细'
        verbose_name_plural = verbose_name

    def __str__(self):
        return 'subject item %s' % self.id


class SubjectBanner(models.Model):
    """
    专题轮播图
    """
    subject = models.ForeignKey(Subject, verbose_name="专题", related_name="images")
    image = models.ImageField(max_length=200, upload_to="image/banner", verbose_name="图片", null=True, blank=True)
    created_time = models.DateTimeField(auto_now_add=True, verbose_name='添加时间')

    class Meta:
        verbose_name = '轮播图'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.subject.title


