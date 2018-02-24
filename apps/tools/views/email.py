from random import Random
from django.core.mail import EmailMultiAlternatives
from django_chenzx.settings import DEFAULT_FROM_EMAIL

from user.models import EmailVerifyRecord


def random_str(randomlength=8):
    str = ''
    chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz0123456789'
    length = len(chars) - 1
    random = Random()
    for i in range(randomlength):
        str += chars[random.randint(0, length)]
    return str


def send_email(email, sendtype='register'):  # 和django.core.mail中函数同名了
    emailrecord = EmailVerifyRecord()
    if sendtype == 'resetemail':
        code = random_str(8)
    else:
        code = random_str(16)

    emailrecord.code = code
    emailrecord.email = email
    emailrecord.sendtype = sendtype
    emailrecord.save()

    emailtitle = ''
    emailbody = ''

    if sendtype == 'register':
        """
        参考：http://code.ziqiangxuetang.com/django/django-send-email.html
        和http://yshblog.com/blog/38
        """
        email_title = '夕象 | 陈志祥的个人博客账户激活'
        url = 'http://chenzx.name/user/active/{0}'.format(code)
        email_body = u'''<h2>夕象 | 陈志祥的个人博客<a href="http://chenzx.name/" target=_blank>chenzx.name</a></h2><br/>
        <p>欢迎注册，请点击下面的链接激活您的帐号(七天后过期)：<a href="%s">%s</a><p>''' % (url, url)

        send_status = EmailMultiAlternatives(
            subject=email_title,
            body=email_body,
            from_email=DEFAULT_FROM_EMAIL,
            to=[email])
        send_status.attach_alternative(emailbody, 'text/html')
        fail_silently = True  # 发送异常不报错
        send_status.send(fail_silently)

        if send_status:
            pass

    elif sendtype == 'forget':
        email_title = '夕象 | 陈志祥的个人博客密码重置'
        url = 'http://chenzx.name/user/resetpwd/{0}'.format(code)
        email_body = u'''<h2>夕象 | 陈志祥的个人博客<a href="http://chenzx.name/" target=_blank>chenzx.name</a></h2><br/>
        <p>请点击下面的链接重置您的账户密码(七天后过期)：<a href="%s">%s</a><p>''' % (url, url)

        send_status = EmailMultiAlternatives(
            subject=email_title,
            body=email_body,
            from_email=DEFAULT_FROM_EMAIL,
            to=[email])
        send_status.attach_alternative(emailbody, 'text/html')
        fail_silently = True  # 发送异常不报错
        send_status.send(fail_silently)

        if send_status:
            pass

    elif sendtype == 'resetemail':
        email_title = '夕象 | 陈志祥的个人博客邮箱修改验证码'
        email_body = '您的邮箱修改验证码为：{0}'.format(code)

        send_status = EmailMultiAlternatives(
            subject=email_title,
            body=email_body,
            from_email=DEFAULT_FROM_EMAIL,
            to=[email])
        send_status.attach_alternative(emailbody, 'text/html')  # ??是否是text
        fail_silently = True  # 发送异常不报错
        send_status.send(fail_silently)

        if send_status:
            pass



