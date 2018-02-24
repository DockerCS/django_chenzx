from PIL import Image
from django.db import models
from django.urls import reverse

from DjangoUeditor.models import UEditorField


# 照片的管理器
class PhotoManager(models.Manager):
    def query_by_mypicture(self, mypicture_id):
        query = self.get_queryset().filter(mypicture_id=mypicture_id)
        return query


class PersonalProfile(models.Model):
    title = models.CharField(max_length=100, verbose_name='标题')
    created_time = models.DateTimeField(auto_now_add=True, verbose_name='添加时间')
    profile = UEditorField(verbose_name='个人简介', height=500, width=1050,
                           default='', blank=True, imagePath='uploads/images/',
                           filePath='uploads/files/')  # 由于存在数据，所以要默认为空, 状态栏精简toolbars='besttome'

    class Meta:
        verbose_name = '个人简介'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.title


class GuesBook(models.Model):
    title = models.CharField(max_length=100, verbose_name='留言板标题')
    content = UEditorField(verbose_name='留言板', height=500, width=1050,
                           default='', blank=True, imagePath='uploads/images/',
                           filePath='uploads/files/')
    created_time = models.DateTimeField(auto_now_add=True, verbose_name='添加时间')

    class Meta:
        verbose_name = '留言板'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.title

    def get_absolute_url(self):
        return reverse('me:guestbook', kwargs=None)


class MyPicture(models.Model):
    """我的相册"""
    title = models.CharField(max_length=100, verbose_name='标题')
    mypicture_cover = models.ImageField(upload_to="image/mypicture/cover", max_length=100, verbose_name='相册封面')
    created_time = models.DateTimeField(auto_now_add=True, verbose_name='添加时间')

    class Meta:
        ordering = ['-created_time']
        verbose_name = '我的相册'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.title

    def save(self, *args, **kwargs):
        cover = Image.open(self.mypicture_cover)

        cover.thumbnail((180, 160), Image.ANTIALIAS)  # 生成缩略图
        cover.save('media/image/mypicture/cover/' + str(self.mypicture_cover), 'JPEG')  # 保存到原路径
        super(MyPicture, self).save(*args, **kwargs)


class Photo(models.Model):
    """相册照片"""
    title = models.CharField(max_length=100, verbose_name='标题')
    mypicture = models.ForeignKey(MyPicture, verbose_name="所属相册")
    photo = models.ImageField(upload_to="image/mypicture/photo", max_length=100, verbose_name='照片')
    # photo_thumbnail = models.CharField(max_length=100, null=True, blank=True, verbose_name='缩略图')
    created_time = models.DateTimeField(auto_now_add=True, verbose_name='添加时间')

    objects = PhotoManager()

    class Meta:
        ordering = ['-created_time']
        verbose_name = '相册照片'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.title

    # def save(self, *args, **kwargs):
    #     self.photo_thumbnail = self.photo
    #
    #     photo_thumbnail = Image.open(self.photo_thumbnail)
    #     photo_thumbnail.thumbnail((180, 160), Image.ANTIALIAS)  # 生成缩略图
    #     photo_thumbnail.save('media/image/mypicture/photo/' + str(self.photo_thumbnail), 'JPEG')  # 保存到另外路径
    #     super(Photo, self).save(*args, **kwargs)