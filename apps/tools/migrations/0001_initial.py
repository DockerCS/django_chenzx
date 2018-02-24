# -*- coding: utf-8 -*-
# Generated by Django 1.10.7 on 2017-10-22 01:07
from __future__ import unicode_literals

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('contenttypes', '0002_remove_content_type_name'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Favorite',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('favorite_id', models.IntegerField(default=0, verbose_name='数据id')),
                ('favorite_type', models.IntegerField(choices=[(1, '文章'), (2, '专题')], default=1, verbose_name='收藏类型')),
                ('favorite_time', models.DateTimeField(auto_now_add=True, verbose_name='收藏时间')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL, verbose_name='用户')),
            ],
            options={
                'verbose_name_plural': '用户收藏',
                'verbose_name': '用户收藏',
            },
        ),
        migrations.CreateModel(
            name='Like',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('object_id', models.PositiveIntegerField(verbose_name='点赞id')),
                ('is_like', models.BooleanField(default=False, verbose_name='是否点赞')),
                ('like_time', models.DateTimeField(auto_now=True, verbose_name='点赞时间')),
                ('content_type', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='contenttypes.ContentType', verbose_name='点赞类型')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL, verbose_name='用户')),
            ],
            options={
                'verbose_name_plural': '点赞详情统计',
                'verbose_name': '点赞详情统计',
                'ordering': ['like_time'],
            },
        ),
        migrations.CreateModel(
            name='LikeNum',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('object_id', models.PositiveIntegerField(verbose_name='点赞id')),
                ('like_num', models.IntegerField(default=0, verbose_name='点赞数目')),
                ('content_type', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='contenttypes.ContentType', verbose_name='点赞类型')),
            ],
            options={
                'verbose_name_plural': '点赞数目统计',
                'verbose_name': '点赞数目统计',
            },
        ),
        migrations.CreateModel(
            name='View',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('object_id', models.PositiveIntegerField(verbose_name='文章id')),
                ('ip_address', models.CharField(max_length=40, verbose_name='ip地址')),
                ('view_time', models.DateTimeField(auto_now=True, verbose_name='点击时间')),
                ('content_type', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='contenttypes.ContentType', verbose_name='阅读类型')),
                ('user', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL, verbose_name='用户')),
            ],
            options={
                'verbose_name_plural': '阅读详情统计',
                'verbose_name': '阅读详情统计',
            },
        ),
        migrations.CreateModel(
            name='ViewNum',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('object_id', models.PositiveIntegerField(verbose_name='文章id')),
                ('view_num', models.IntegerField(default=0, verbose_name='阅读总数')),
                ('content_type', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='contenttypes.ContentType', verbose_name='阅读类型')),
            ],
            options={
                'verbose_name_plural': '阅读数目统计',
                'verbose_name': '阅读数目统计',
            },
        ),
    ]
