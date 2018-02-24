# -*- coding: utf-8 -*-
from django.views import View
from django.http import HttpResponse

from ..models import Favorite


class AddFavoriteView(View):
    """
    用户收藏和取消收藏
    """
    def post(self, request):
        if not request.user.is_authenticated():
            # 判断用户是否登录
            return HttpResponse('{"status":"fail", "msg":"用户未登录"}', content_type='application/json')

        favorite_id = request.POST.get('favorite_id', 0)
        favorite_type = request.POST.get('favorite_type', 0)
        exist_favorite = Favorite.objects.filter(user=request.user, favorite_id=int(favorite_id), favorite_type=int(favorite_type))

        if exist_favorite:
            # 如果记录存在则删除收藏
            exist_favorite.delete()
            return HttpResponse('{"status":"success", "msg":"收藏"}', content_type='application/json')
        else:
            favorite = Favorite()
            if int(favorite_id) > 0 and int(favorite_type) > 0:
                favorite.user = request.user
                favorite.favorite_id = int(favorite_id)
                favorite.favorite_type = int(favorite_type)
                favorite.save()
                return HttpResponse('{"status":"success", "msg":"已收藏"}', content_type='application/json')
            else:
                return HttpResponse('{"status":"fail", "msg":"收藏出错"}', content_type='application/json')
