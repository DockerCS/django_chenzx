import xadmin

from .models import View, ViewNum, Like, LikeNum, Favorite


class ViewAdmin(object):
    """文章浏览详细记录"""
    list_display = ('content_type', 'object_id', 'ip_address', 'user', 'view_time')
    ordering = ('-view_time',)


class ViewNumAdmin(object):
    """文章浏览计数"""
    list_display = ('content_type', 'object_id', 'view_num')


class LikeAdmin(object):
    """点赞明细记录"""
    list_display = ('content_type', 'object_id', 'user', 'is_like', 'like_time')
    ordering = ('-like_time',)


class LikeNumAdmin(object):
    """点赞数目记录"""
    list_display = ('content_type', 'object_id', 'like_num')


class FavoriteView(object):
    """收藏记录"""
    list_display = ('user', 'favorite_type', 'favorite_id', 'favorite_time')


xadmin.site.register(View, ViewAdmin)
xadmin.site.register(ViewNum, ViewNumAdmin)
xadmin.site.register(Like, LikeAdmin)
xadmin.site.register(LikeNum, LikeNumAdmin)
xadmin.site.register(Favorite, FavoriteView)
