import xadmin
from xadmin.views import BaseAdminPlugin, ListAdminView
from django.template import loader


# 由excel导入数据
class ListImportExcelPlugin(BaseAdminPlugin):
    import_excel = True  # 默认为True， 加载此插件

    def init_request(self, *args, **kwargs):
        return bool(self.import_excel)

    def block_top_toolbar(self, context, nodes):
        nodes.append(loader.render_to_string('xadmin/excel/model_list.toolbar.import.html', context=context))  # 版本 1.8 以后废弃：废弃context_instance 参数，仅仅使用context。

xadmin.site.register_plugin(ListImportExcelPlugin, ListAdminView)