# 搜索引擎方法
from haystack import indexes
from .models import Article

# 索引
class ArticleIndex(indexes.SearchIndex, indexes.Indexable):
    # data['rand_articles'] = rand_article()  # 搜索页随机推荐文章
    text = indexes.CharField(document=True, use_template=True)

    def get_model(self):
        return Article

    def index_queryset(self, using=None):
        return self.get_model().objects.all()