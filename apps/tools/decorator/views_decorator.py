# coding:utf-8
from django.http import Http404
from django.contrib.contenttypes.models import ContentType

from ..models import View, ViewNum


# 阅读计数装饰器，需要指定模型类，传入的参数数目、名称也需要一样
def record_view(model_type):
    """文章阅读次数的装饰器"""
    def __record_view(func):
        def warpper(self, request, article_id):
            try:
                obj = model_type.objects.get(id=article_id)
            except model_type.DoesNotExist:
                raise Http404

            # 获取模型的名称做为Cookie的键名
            model_name = str(model_type).split("'")[1]
            cookie_name = "%s_%s_readed" % (model_name.split('.')[-1], article_id)

            # 判断Cookie是否存在
            # if not request.COOKIES.get(cookie_name):
            # if not request.COOKIES.has_key(cookie_name):  # 这种判断方法错误，我暂时也不知道错在哪里？
            if cookie_name not in request.COOKIES:
                # 添加明细记录
                recorder = View(content_object=obj)
                recorder.ip_address = request.META.get("HTTP_X_FORWARDED_FOR", request.META.get("REMOTE_ADDR", None))  # 缺失request.META.get("REMOTE_ADDR", None)会出错，显示ip地址为空，而model定义的不为空？
                # recorder.ip_address = request.META.get("REMOTE_ADDR", None)
                recorder.user = request.user if request.user.is_authenticated() else None
                recorder.save()

                # 总记录+1
                obj_type = ContentType.objects.get_for_model(obj)
                viewers = ViewNum.objects.filter(content_type=obj_type, object_id=obj.id)

                if viewers.count() > 0:
                    viewer = viewers[0]
                else:
                    viewer = ViewNum(content_type=obj_type, object_id=obj.id)
                viewer.view_num += 1
                viewer.save()

            # 执行原来的方法(响应页面)
            response = func(self, request, article_id)

            # 添加临时cookie，关闭浏览器之后就过期
            response.set_cookie(cookie_name, "True")
            return response  # 返回内容给前端
        return warpper
    return __record_view


# 阅读计数装饰器，需要指定模型类，传入的参数数目、名称也需要一样
def record_view_aboutme(model_type):
    """文章阅读次数的装饰器"""
    def __record_view(func):
        def warpper(self, request):
            try:
                obj = model_type.objects.get(id=1)
            except model_type.DoesNotExist:
                raise Http404

            # 获取模型的名称做为Cookie的键名
            model_name = str(model_type).split("'")[1]
            cookie_name = "%s_%s_readed" % (model_name.split('.')[-1], 1)

            # 判断Cookie是否存在
            # if not request.COOKIES.get(cookie_name):
            # if not request.COOKIES.has_key(cookie_name):  # 这种判断方法错误，我暂时也不知道错在哪里？
            if cookie_name not in request.COOKIES:
                # 添加明细记录
                recorder = View(content_object=obj)
                recorder.ip_address = request.META.get("HTTP_X_FORWARDED_FOR", request.META.get("REMOTE_ADDR", None))  # 缺失request.META.get("REMOTE_ADDR", None)会出错，显示ip地址为空，而model定义的不为空？
                # recorder.ip_address = request.META.get("REMOTE_ADDR", None)
                recorder.user = request.user if request.user.is_authenticated() else None
                recorder.save()

                # 总记录+1
                obj_type = ContentType.objects.get_for_model(obj)
                viewers = ViewNum.objects.filter(content_type=obj_type, object_id=obj.id)

                if viewers.count() > 0:
                    viewer = viewers[0]
                else:
                    viewer = ViewNum(content_type=obj_type, object_id=obj.id)
                viewer.view_num += 1
                viewer.save()

            # 执行原来的方法(响应页面)
            response = func(self, request)

            # 添加临时cookie，关闭浏览器之后就过期
            response.set_cookie(cookie_name, "True")
            return response  # 返回内容给前端
        return warpper
    return __record_view