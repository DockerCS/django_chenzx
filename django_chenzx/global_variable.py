# -*- coding: utf-8 -*-
from django.db import models

from post.models import Article
from tools.models import Like
from tools.views.article_recommend import rand_article


def like_or_not(request):
    """
    设置一个用户是否点赞的全局变量，这个函数需要在settings.py.TEMPLATES.OPTIONS.context_processors加入
    当文章id存在于用户已经点赞的id表中，就前端显示填满颜色的爱心，否则为空爱心，用户没有登陆也是空爱心
    注意需要判断like_article.is_like是否为真，不然取消点赞的文章也会存在列表中
    """""
    like_article_id_list = []

    if request.user.is_authenticated():
        for like_article in Like.objects.filter(user=request.user):  # 由于引用了request.user，所以需要判断request.user.is_authenticated():，不然TypeError: 'AnonymousUser' object is not iterable
            if like_article.is_like:
                article_id = like_article.object_id
                # article = Article.objects.get(id=article_id)
                like_article_id_list.append(article_id)
    content = {'like_article_id_list': like_article_id_list}
    return content


def user_recommend(request):
    """
    用户推荐文章
    """
    data = {}
    data['rand_articles'] = rand_article()
    sql = "SELECT `post_article`.`id`, `post_article`.`title`, SUM(`tools_viewnum`.`view_num`) AS `view_nums` FROM `post_article` LEFT OUTER JOIN `tools_viewnum` ON (`post_article`.`id` = `tools_viewnum`.`object_id` AND (`tools_viewnum`.`content_type_id` = 12)) WHERE `post_article`.`is_published` = True GROUP BY `post_article`.`id` ORDER BY `view_nums` DESC LIMIT 10"
    data['click_article_list'] = Article.objects.raw(sql)
    # data['click_article_list'] = Article.objects.filter(is_published=True).annotate(view_nums=models.Sum('view_num')).order_by('-view_nums')[:10]  # 点击排行

    return data

