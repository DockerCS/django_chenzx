# coding:utf-8
from django import template
from django.contrib.contenttypes.models import ContentType
from ..models import LikeNum

# 得到自定义标签库，用于注册标签
register = template.Library()


# 继承template.Node类，实现render方法
class LikeCountNode(template.Node):
    def __init__(self, object_expr, as_varname):
        self.object_expr = object_expr
        self.as_varname = as_varname

    def render(self, context):
        # 反向解析，从context得到对象
        obj = self.object_expr.resolve(context)
        obj_type = ContentType.objects.get_for_model(obj)

        # 获取阅读总数
        likes = LikeNum.objects.filter(content_type=obj_type, object_id=obj.id)
        like_num_all = sum(map(lambda x: x.like_num, likes))

        # 返回阅读总数
        context[self.as_varname] = str(like_num_all)
        return ''


# 注册tag(需要重启服务，才能生效)，可以用@register.tag(name=xxx)指定标签名称
@register.tag
def get_like_nums(parser, token):
    """
        get object view number
        {% get_like_nums for article as like_num %}
        {{ like_num }}
    """
    tokens = token.split_contents()

    # 分析参数是否正确
    if len(tokens) != 5:
        raise template.TemplateSyntaxError("the args must be 5 argument in %r" % tokens[0])
    if tokens[1] != 'for':
        raise template.TemplateSyntaxError("Second argument in %r tag must be 'for'" % tokens[0])
    if tokens[3] != 'as':
        raise template.TemplateSyntaxError("Fourth argument in %r must be 'as'" % tokens[0])

    return LikeCountNode(parser.compile_filter(tokens[2]), tokens[4])