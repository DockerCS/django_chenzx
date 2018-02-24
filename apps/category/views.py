from django.shortcuts import render
from django.views.generic import View

from .models import Category
from post.models import Article
from tools.views.paginate import getPages


class CategoryView(View):
    """
    博客分类
    """
    def get(self, request, category_id):
        categories = Category.objects.all()

        # filter(is_published=True)排除未发表文章，filter需要放到query后面？为什么？
        # article_category_list = Article.objects.query_by_category(category_id).filter(is_published=True).order_by('-created_time')
        if request.user.username == "chenzhixiang1992":
            article_category_list = Article.objects.filter(category_id=category_id).order_by('-created_time')
        else:
            article_category_list = Article.objects.filter(category_id=category_id, is_published=True).order_by('-created_time')
        pages, article_category_list = getPages(request, article_category_list, 10)

        data = {}
        data['categories'] = categories
        data['article_category_list'] = article_category_list
        data['current_category'] = category_id
        data['pages'] = pages
        return render(request, 'category/article_category_page.html', data)


class ArticleFilterView(View):
    """
    博客分类之后筛选
    """
    def get(self, request):
        category_id = request.GET.get('current_category')

        # filter(is_published=True)排除未发表文章，filter需要放到query后面？为什么？
        article_category_list = Article.objects.filter(category_id=category_id, is_published=True).order_by('-created_time')
        pages, article_category_list = getPages(request, article_category_list, 10)

        data = {}
        data['article_category_list'] = article_category_list
        data['current_category'] = category_id
        data['pages'] = pages
        return render(request, 'category/article_category_page.html', data)



