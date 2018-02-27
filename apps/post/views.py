from django.shortcuts import render, get_object_or_404
from django.views.generic import View

from .models import Article
from category.models import Category
from tools.models import Favorite
from tools.views.paginate import getPages
from tools.views.article_recommend import pre_next_article
from tools.decorator.views_decorator import record_view


class IndexView(View):
    """
    博客文章列表,也是首页
    """
    def get(self, request):
        categories = Category.objects.all()
        if request.user.is_superuser:
            article_list = Article.objects.all().order_by('-created_time')
        else:
            article_list = Article.objects.filter(is_published=True).order_by('-created_time')  # filter(is_published=True)排除未发表文章
        pages, article_list = getPages(request, article_list, 10)

        sql = "SELECT `post_article`.`id`, `post_article`.`title`, SUM(`tools_likenum`.`like_num`) AS `like_nums` FROM `post_article` LEFT OUTER JOIN `tools_likenum` ON (`post_article`.`id` = `tools_likenum`.`object_id` AND (`tools_likenum`.`content_type_id` = 12)) WHERE `post_article`.`is_published` = True GROUP BY `post_article`.`id` ORDER BY `like_nums` DESC LIMIT 5"
        hot_article_list = Article.objects.raw(sql)
        new_article_list = article_list[:5]

        data = {}
        data['categories'] = categories
        data["article_list"] = article_list
        data['pages'] = pages
        data['hot_article_list'] = hot_article_list
        data['new_article_list'] = new_article_list

        return render(request, 'index.html', data)


class ArticleDetailView(View):
    """
    博客详情页
    """
    @record_view(Article)
    def get(self, request, article_id):
        categories = Category.objects.all()

        has_favorite = False
        if request.user.is_authenticated():
            if Favorite.objects.filter(user=request.user, favorite_id=int(article_id), favorite_type=int(1)):  # 前端传回的article_id的type为str需要转换为int才能查询
                has_favorite = True

        data = {}
        data['categories'] = categories
        data['article'] = get_object_or_404(Article, id=article_id)
        data['content'] = data['article'].content
        data['pre_article'] = pre_next_article(article_id)[0]  # 代表引用pre_next_article方法返回的第一个参数
        data['next_article'] = pre_next_article(article_id)[1]  # 代表引用pre_next_article方法返回的第二个参数
        data['has_favorite'] = has_favorite  # 判断是否收藏

        return render(request, 'post/article_detail_page.html', data)
