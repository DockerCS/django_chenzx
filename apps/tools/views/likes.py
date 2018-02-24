import json

from django.views import View
from django.http import HttpResponse
from django.contrib.contenttypes.models import ContentType

from tools.models import Like, LikeNum
from tools.decorator.likes_decorator import check_request


# 导入likes自定义的装饰器
class LikeView(View):
    """
    用户点赞
    """
    # @check_request('like_type', 'like_id')
    def post(self, request):
        u"""处理改变点赞状态
                Method: POST
                params:
                type  : object type
                id    : object id
                return: json
            """
        # 创建json对象需要的数据
        if not request.user.is_authenticated():
            # 判断用户是否登录
            return HttpResponse('{"status":"fail", "msg":"用户未登录"}', content_type='application/json')

        # 获取数据和对应的对象
        obj_type = request.POST.get('like_type')
        obj_id = request.POST.get('like_id')

        c = ContentType.objects.get(model=obj_type)

        # 获取LikeNum对象
        try:
            l = LikeNum.objects.get(content_type=c, object_id=obj_id)
        except Exception as e:
            # 没有获取到对象，则新增一个Likes对象
            l = LikeNum(content_type=c, object_id=obj_id)

        # 获取Likes明细对象
        try:
            detail = Like.objects.get(content_type=c, object_id=obj_id, user=request.user)
        except Exception as e:
            detail = Like(content_type=c, object_id=obj_id, user=request.user)

        liked = detail.is_like
        data = {}

        # 判断是否赞过，或者取消赞
        if liked:
            # 修改明细
            detail.is_like = False
            detail.save()

            # 更新点赞数目记录
            l.like_num -= 1
            if l.like_num < 0:
                l.like_num = 0
            l.save()

            # 返回前端的数据
            data['like_num'] = '%s喜欢' % l.like_num
            data['status'] = "success"
            data['msg'] = "您已取消点赞"
            return HttpResponse(json.dumps(data), content_type='application/json')
        else:
            # 修改明细
            detail.is_like = True
            detail.save()

            # 更新点赞数目记录
            l.like_num += 1
            if l.like_num < 0:
                l.like_num = 0
            l.save()

            # 返回前端的数据
            data['like_num'] = '%s喜欢' % l.like_num
            data['status'] = "success"
            data['msg'] = "您已点赞"
            return HttpResponse(json.dumps(data), content_type='application/json')

