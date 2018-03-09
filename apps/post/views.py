from django.shortcuts import render, get_object_or_404
from django.views.generic import View

from .models import Article
from category.models import Category
from subject.models import SubjectBanner
from tools.views.paginate import getPages
from tools.views.article_recommend import pre_next_article
from tools.decorator.views_decorator import record_view


class IndexView(View):
    """
    博客文章列表,也是首页
    """
    def get(self, request):
        categories = Category.objects.all()

        banners = SubjectBanner.objects.order_by('?')[:5]  # 取轮播图任意五条
        # banners = []
        # for banner_item in banner:
        #     banners.append(banner_item)
        #     if len(banners) == 5:
        #         banners.insert(0, banner[4])
        #         banners.append(banner[0])

        if request.user.is_superuser:
            article_list = Article.objects.all().order_by('-created_time')
        else:
            article_list = Article.objects.filter(is_published=True).order_by('-created_time')  # filter(is_published=True)排除未发表文章

        recommend_article_list = article_list.filter(is_recommend=True, is_published=True).order_by('-created_time')  # 最新推荐
        pages, article_list = getPages(request, article_list, 10)

        # 筛选出点赞、收藏、热评的前五，以时间顺序排列
        hot_like_sql = "SELECT `post_article`.`id`, `post_article`.`title`, SUM(`tools_likenum`.`like_num`) AS `like_nums` FROM `post_article` LEFT OUTER JOIN `tools_likenum` ON (`post_article`.`id` = `tools_likenum`.`object_id` AND (`tools_likenum`.`content_type_id` = 12)) WHERE `post_article`.`is_published` = True GROUP BY `post_article`.`id` ORDER BY `like_nums` DESC LIMIT 5"
        hot_favorite_sql = "SELECT `post_article`.`id`, `post_article`.`title`, COUNT( `tools_favorite`.`favorite_id` ) AS `favorite_nums` FROM post_article LEFT OUTER JOIN `tools_favorite` ON (`post_article`.`id` = `tools_favorite`.`favorite_id` AND (`tools_favorite`.`favorite_type` = 1)) WHERE `post_article`.`is_published` = TRUE GROUP BY post_article.id ORDER BY favorite_nums DESC LIMIT 5"
        hot_comment_sql = "select `post_article`.`id`, `post_article`.`title`, count( c.object_pk ) AS comment_count from post_article left join (select * from django_comments where content_type_id =12) as c on post_article.id = c.object_pk WHERE `post_article`.`is_published` = TRUE group by post_article.id order by comment_count desc  LIMIT 5"
        hot_like_article_list = Article.objects.raw(hot_like_sql)  # 点赞排行
        hot_favorite_article_list = Article.objects.raw(hot_favorite_sql)
        hot_comment_article_list = Article.objects.raw(hot_comment_sql)  # 热评排行

        data = {}
        data['categories'] = categories
        data['banners'] = banners
        data["article_list"] = article_list
        data['pages'] = pages
        data['hot_like_article_list'] = hot_like_article_list
        data['hot_favorite_article_list'] = hot_favorite_article_list
        data['recommend_article_list'] = recommend_article_list
        data['hot_comment_article_list'] = hot_comment_article_list

        return render(request, 'index.html', data)


class ArticleDetailView(View):
    """
    博客详情页
    """
    @record_view(Article)
    def get(self, request, id):
        categories = Category.objects.all()

        data = {}
        data['categories'] = categories
        data['article'] = get_object_or_404(Article, id=id)
        data['content'] = data['article'].content
        data['pre_article'] = pre_next_article(id)[0]  # 代表引用pre_next_article方法返回的第一个参数
        data['next_article'] = pre_next_article(id)[1]  # 代表引用pre_next_article方法返回的第二个参数

        return render(request, 'post/article_detail_page.html', data)