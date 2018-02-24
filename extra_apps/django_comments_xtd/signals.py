"""
Signals relating to django-comments-xtd.
"""
from django.dispatch import Signal

# Sent just after a comment has been verified.
confirmation_received = Signal(providing_args=["comment", "request"])

# Sent just after a user has muted a comments thread.
comment_thread_muted = Signal(providing_args=["comment", "requests"])

comment_will_be_posted = Signal(providing_args=["comment", "request"])
comment_was_posted = Signal(providing_args=["comment", "request"])
comment_was_flagged = Signal(providing_args=["comment", "flag", "created", "request"])

from django.dispatch import receiver
from django.shortcuts import get_object_or_404
from notifications.signals import notify

try:
    from django.apps import apps
except ImportError:
    from django.db import models as apps

from django_comments.models import Comment
from . import get_model


@receiver(comment_was_posted, sender=Comment)
def send_message(sender, **kwargs):
    # 获取相关数据
    comment = kwargs['comment']
    request = kwargs['request']
    user = comment.user
    username = user.first_name or user.username

    # 获取评论的对象
    data = request.POST.copy()
    ctype = data.get("content_type")
    object_pk = data.get("object_pk")
    model = apps.get_model(*ctype.split(".", 1))
    target = model._default_manager.using(None).get(pk=object_pk)

    # 判断是评论还是回复，设置消息标题
    if int(comment.root_id) == 0:
        # 评论对象（博客，专题）
        content_object = comment.content_type.get_object_for_this_type(id=object_pk)
        recipient = content_object.author  # 被评论时，通知文章作者
        verb = u'[%s] 评论你了' % username
    else:
        # 被回复
        reply_to = get_object_or_404(get_model(), id=comment.reply_to)
        recipient = reply_to.user  # 被回复时，通知评论者
        verb = u'[%s] 回复你了' % username

    # 发送消息（level: 'success', 'info', 'warning', 'error'）
    message = {}
    message['recipient'] = recipient  # 消息接收人
    message['verb'] = verb  # 消息标题
    message['description'] = comment.comment  # 评论详细内容
    message['target'] = target  # 目标对象
    message['action_object'] = comment  # 评论记录
    notify.send(user, **message)
