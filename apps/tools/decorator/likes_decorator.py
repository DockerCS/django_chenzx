# coding:utf-8
import json
from django.http import HttpResponse


# 检查request参数是否缺失
def check_request(*params):
    def _check_request(func):
        def warpper(request):
            # 遍历参数
            for param in params:
                if param not in request.POST:
                    data = {}
                    data['status'] = 402
                    data['message'] = u'no params:%s' % param
                    return HttpResponse(json.dumps(data), content_type="application/json")

            # 参数都存在，继续执行
            return func(request)
        return warpper
    return _check_request


