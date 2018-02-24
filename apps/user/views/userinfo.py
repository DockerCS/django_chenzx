import json

from django.shortcuts import render
from django.http import HttpResponse
from django.views.generic.base import View

from ..models import UserProfile, EmailVerifyRecord
from ..forms import UploadAvataForm, UserInfoForm, ModifyPwdForm
from post.models import Article
from tools.views.email import send_email
from tools.models import Favorite
from tools.utils.mixin_utils import LoginRequiredMixin


class UserInfoView(LoginRequiredMixin, View):
    """
    用户个人中心以及修改用户的fields = ['nickname', 'gender', 'birthday', 'mobile']这些字段
    """
    def get(self, request):
        return render(request, 'user/userinfo/userinfo.html', {})

    def post(self, request):
        userinfoform = UserInfoForm(request.POST, instance=request.user)  # instance指定一个实例，表示修改该实例的字段，不然汇创建一个新的实例
        if userinfoform.is_valid():
            if not UserProfile.objects.exclude(username=request.user).filter(username=userinfoform.cleaned_data['nickname']):
                request.user.username = userinfoform.cleaned_data['nickname']
                request.user.save()
                userinfoform.save()
                return HttpResponse('{"status":"success"}', content_type='application/json')
            else:
                return HttpResponse('{"status":"fail"}', content_type='application/json')

        else:
            return HttpResponse(json.dumps(userinfoform.errors), content_type='application/json')


class UploadAvatarView(LoginRequiredMixin, View):
    """
    用户修改头像
    """
    # 第一种方法
    # def post(self, request):
    #     uploadavatarform = UploadAvataForm(request.POST, request.FILES)  # 实例化上传头像的字段， 文件类型在request.FILES传入
    #     if uploadavatarform.is_valid():
    #         avatar = uploadavatarform.cleaned_data['avatar']
    #         request.user.avatar = avatar
    #         request.user.save()

    # 第二种方法
    def post(self, request):
        uploadavatarform = UploadAvataForm(request.POST, request.FILES, instance=request.user)  # 实例化上传头像的字段， 文件类型在request.FILES传入
        if uploadavatarform.is_valid():
            uploadavatarform.save()
            return HttpResponse('{"status":"success"}', content_type='application/json')
        else:
            return HttpResponse('{"status":"fail"}', content_type='application/json')


# 个人中心修改密码
class ModifyPwdView(LoginRequiredMixin, View):
    """
    用户个人中心修改密码
    """

    def post(self, request):
        modifypwdform = ModifyPwdForm(request.POST)
        if modifypwdform.is_valid():
            pwd1 = request.POST.get('password1')
            pwd2 = request.POST.get('password2')
            if pwd1 != pwd2:
                return HttpResponse('{"status":"fail", "msg":"密码不一致"}', content_type='application/json')
            user = request.user
            user.set_password(pwd1)
            user.save()

            return HttpResponse('{"status":"success"}', content_type='application/json')
        else:
            return HttpResponse(json.dumps(modifypwdform.errors), content_type='application/json')


# 用户中心发送修改邮箱的验证码
class SendEmailCodeView(LoginRequiredMixin, View):
    """
    个人中心修改登陆邮箱时发送邮箱验证码
    """
    def get(self, request):
        email = request.GET.get('email')

        # 先检查更换的邮箱是否存在
        if UserProfile.objects.filter(email=email):
            return HttpResponse('{"email":"该邮箱已经注册"}', content_type='application/json')

        send_email(email, 'resetemail')
        return HttpResponse('{"status":"success"}', content_type='application/json')


class ResetEmailView(LoginRequiredMixin, View):
    """
    用户中心修改个人登陆邮箱
    """
    def post(self, request):
        email = request.POST.get('email')
        code = request.POST.get('code')

        existed_code = EmailVerifyRecord.objects.filter(email=email, code=code, sendtype='resetemail')
        if existed_code:
            user = request.user
            user.email = email
            user.save()
            return HttpResponse('{"status":"success"}', content_type='application/json')
        else:
            return HttpResponse('{"email":"验证出错，请重新发送"}', content_type='application/json')


class MyFavArticleView(LoginRequiredMixin, View):
    """
    我收藏的文章
    """
    def get(self, request):
        fav_article_list = []
        fav_articles = Favorite.objects.filter(user=request.user, favorite_type=int(1))  # Favorite没有设置外键，取得的数据还需要转换

        for fav_article in fav_articles:
            article_id = fav_article.favorite_id
            article = Article.objects.get(id=article_id)
            fav_article_list.append(article)

        return render(request, 'user/userinfo/userfavorite_article.html', {'fav_article_list': fav_article_list})


class MyFavTopicView(LoginRequiredMixin, View):
    """
    我收藏的专题
    """
    def get(self, request):
        return render(request, 'user/userinfo/userfavorite_topic.html', {})


class UserMessageView(LoginRequiredMixin, View):
    """
    用户中心我的消息部分
    """
    def get(self, request):
        return render(request, 'user/userinfo/usermessage.html', {})


class UserCommentView(LoginRequiredMixin, View):
    """
    用户中心我的评论
    """
    def get(self, request):
        user = request.user
        unread = user.notifications.unread()[:30]

        data = {}
        data['unread_list'] = unread  # 返回未读消息
        return render(request, 'user/userinfo/usercomment.html', data)




