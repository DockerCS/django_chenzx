from django.db import models


class Category(models.Model):
    name = models.CharField(max_length=50, verbose_name='分类名称')
    parent = models.ForeignKey('self', null=True, blank=True, related_name='children', verbose_name='上一级分类名称')
    path = models.CharField(max_length=255, null=True, blank=True, verbose_name='分类路径')  # 例如 2:4:7 就是表示有三级分类，数字表示分类的id，随着创建子分类的数目而增大，可能后面创建的以及大分类id小于子分类id

    def __str__(self):
        if self.id == self.path:
            return self.name
        else:
            return self.node

    def _node(self):
        indent_num = len(self.path.split(':')) - 1
        indent = '....' * indent_num
        node = u'%s%s' % (indent, self.name)
        return node

    node = property(_node)

    class Meta:
        ordering = ['path']
        verbose_name = '博客分类'
        verbose_name_plural = verbose_name

    # 设置在model中的用途是，是在所有节点保存时递归的循环下去，更新所有的节点的路径
    def save(self, *args, **kwargs):
        # 先保存数据,如果是新添加的数据，放在第一行是用来获得id，因为id是path的重要组成
        super(Category, self).save(*args, **kwargs)
        if self.parent:
            self.path = '%s:%s' % (self.parent.path, self.id)
        else:
            self.path = self.id

        # 更新完当前节点path后，要进行一次保存，否则在编辑类别时，子分类循环保存父类path不是最新的
        super(Category, self).save(*args, **kwargs)

        childrens = self.children.all()
        if len(childrens) > 0:
            for children in childrens:
                children.path = '%s:%s' % (self.path, children.id)

                children.save()
