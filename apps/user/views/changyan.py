# -*- coding: utf-8 -*-
import base64
import hmac
# import app_key

from django.http import HttpResponse


def SsoSign(a, b, c, d):
    str1 = 'img_url={img_url}&nickname={nickname}&profile_url={profile_url}&user_id={user_id}'.format(img_url=a, nickname=b, profile_url=c, user_id=d)
    signature = base64.b64encode(hmac.new(app_key.encode('utf-8'), str1.encode('utf-8'), digestmod=sha1).hexdigest().encode('utf-8')).decode('utf-8')
    return signature

def get_user_info(request):
    callback = request.GET.get('callback')
    if request.user.is_authenticated():
         img_url = 'media/{0}'.format(request.user.avatar)
         nickname = request.user.username
         profile_url = ''
         user_id = request.user.id
         result = {
            "is_login": 1,
            "user": {
                "img_url": img_url,
                "nickname": nickname,
                "profile_url": profile_url,
                "user_id": user_id,
                "sign":SsoSign(img_url, nickname, profile_url, user_id)
                }
            }
         result = '{0}({1})'.format(callback, result)
         return HttpResponse(result)
    else:
         result = {
                    "is_login": 0,
                }
         result = '{0}({1})'.format(callback, result)
         return HttpResponse(result)

