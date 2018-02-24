# -*- coding: utf-8 -*-
# Generated by Django 1.10.7 on 2017-10-13 11:55
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Category',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50, verbose_name='分类名称')),
                ('path', models.CharField(blank=True, max_length=255, null=True, verbose_name='分类路径')),
                ('parent', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='children', to='category.Category', verbose_name='上一级分类名称')),
            ],
            options={
                'verbose_name_plural': '博客分类',
                'verbose_name': '博客分类',
                'ordering': ['path'],
            },
        ),
    ]
