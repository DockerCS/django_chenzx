# -*- coding: utf-8 -*-
# Generated by Django 1.10.7 on 2017-10-26 13:28
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('django_comments_xtd', '0005_auto_20171003_0340'),
    ]

    operations = [
        migrations.AddField(
            model_name='xtdcomment',
            name='parent_comment',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='children', to='django_comments_xtd.XtdComment', verbose_name='parent comment'),
        ),
    ]
