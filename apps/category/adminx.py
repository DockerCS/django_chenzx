# -*- coding: utf-8 -*-
import xadmin

from .models import Category

class CategoryAdmin(object):
    list_display = ['treenode', 'patha', 'id']
    ordering = ['path']

    def patha(self, obj):
        if obj.parent:
            return u'%s > %s' % (obj.parent, obj.name)
        return obj.name

    patha.short_description = 'path'
    patha.allow_tags = True

    def treenode(self, obj):
        indent_num = len(obj.path.split(':')) - 1
        p = '<div style="text-indent:%spx;">%s</div>' % (indent_num * 25, obj.name)
        return p

    treenode.short_description = 'tree path'
    treenode.allow_tags = True

xadmin.site.register(Category, CategoryAdmin)

