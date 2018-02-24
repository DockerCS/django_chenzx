from django.db import models
from django.contrib.contenttypes.models import ContentType  # 引用ContentType相关模块
from django.contrib.contenttypes.fields import GenericForeignKey
from user.models import UserProfile  # 引用系统自带的用户模型


"""阅读统计"""
class View(models.Model):
    """阅读明细记录"""
    # ContentType设置
    content_type = models.ForeignKey(ContentType, verbose_name='阅读类型')
    object_id = models.PositiveIntegerField(verbose_name='文章id')
    content_object = GenericForeignKey(
        ct_field="content_type",
        fk_field="object_id"
    )

    # 普通字段
    # 记录IP地址
    ip_address = models.CharField(max_length=40, verbose_name='ip地址')  # 15可能对于实际ip太短，导致了500错误，关闭500页面显示Data too long for column 'ip_address' at row 1

    # 记录User，这里可能没有登录用户，所以要允许为空
    user = models.ForeignKey(UserProfile, blank=True, null=True, verbose_name='用户')

    # 阅读的时间
    view_time = models.DateTimeField(auto_now=True, verbose_name='点击时间')

    class Meta:
        verbose_name = '阅读详情统计'
        verbose_name_plural = verbose_name


class ViewNum(models.Model):
    """阅读数量记录"""
    # ContentType设置
    content_type = models.ForeignKey(ContentType, verbose_name='阅读类型')
    object_id = models.PositiveIntegerField(verbose_name='文章id')
    content_object = GenericForeignKey(
        ct_field="content_type",
        fk_field="object_id"
    )

    # 普通字段，阅读总数量
    view_num = models.IntegerField(default=0, verbose_name='阅读总数')

    class Meta:
        verbose_name = '阅读数目统计'
        verbose_name_plural = verbose_name

    def __str____(self):
        return u'<%s:%s> %s' % (self.content_type, self.object_id, self.view_num)


"""点赞统计"""
class Like(models.Model):
    """点赞明细记录"""
    content_type = models.ForeignKey(ContentType, verbose_name='点赞类型')
    object_id = models.PositiveIntegerField(verbose_name='点赞id')
    content_object = GenericForeignKey(
        ct_field="content_type",
        fk_field="object_id"
    )
    # like = models.ForeignKey('LikeNum', verbose_name='点赞类型[点赞id, 点赞数目]')
    user = models.ForeignKey(UserProfile, verbose_name='用户')  # 必须登录才能点赞
    is_like = models.BooleanField(default=False, verbose_name='是否点赞')
    like_time = models.DateTimeField(auto_now=True, verbose_name='点赞时间')  # 点赞的时间


    class Meta:
        verbose_name = '点赞详情统计'
        verbose_name_plural = verbose_name
        ordering = ['like_time']


class LikeNum(models.Model):
    """点赞数目记录"""
    content_type = models.ForeignKey(ContentType, verbose_name='点赞类型')
    object_id = models.PositiveIntegerField(verbose_name='点赞id')
    content_object = GenericForeignKey(
        ct_field="content_type",
        fk_field="object_id"
    )

    # 点赞数目
    like_num = models.IntegerField(default=0, verbose_name='点赞数目')

    class Meta:
        verbose_name = '点赞数目统计'
        verbose_name_plural = verbose_name

    def __str__(self):
        return u'%s[%s, %s]' % (self.content_type, self.object_id, self.like_num)


class Favorite(models.Model):
    """
    用户收藏
    """
    user = models.ForeignKey(UserProfile, verbose_name='用户')
    favorite_id = models.IntegerField(default=0, verbose_name='数据id')
    favorite_type = models.IntegerField(choices=((1, "文章"), (2, "专题")), default=1, verbose_name='收藏类型')
    favorite_time = models.DateTimeField(auto_now_add=True, verbose_name='收藏时间')

    class Meta:
        verbose_name = '用户收藏'
        verbose_name_plural = verbose_name
