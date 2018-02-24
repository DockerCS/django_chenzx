import xadmin
from xadmin import views

from .models import UserProfile, EmailVerifyRecord

# xadmin主题
class BaseSetting(object):
    enable_themes = True
    use_bootswatch = True

# 全局修改
class GlobalSetting(object):
    site_title = '夕象 | 陈志祥的个人博客'  # 页头
    site_footer = 'Copyright 2017 夕象 | 陈志祥的个人博客'  # 页脚
    menu_style = 'accordion'  # xadmin后台折叠各app的model

# 默认已经注册
class UserProfileAdmin(object):
    list_display = ['nikename']

class EmailVerifyRecordAdmin(object):
    list_display = ['code', 'email', 'sendtype', 'sendtime']  # 使用数组比元组好, 元组只有一个元素的时候需要加逗号结尾
    search_fields = ['code', 'email', 'sendtype']  # 不对时间进行搜索
    list_filter = ['code', 'email', 'sendtype', 'sendtime']  # 过滤器
    # model_icon = 'fa fa-key'

# xadmin.site.register(UserProfile, UserProfileAdmin)
xadmin.site.register(EmailVerifyRecord, EmailVerifyRecordAdmin)
xadmin.site.register(views.BaseAdminView, BaseSetting)
xadmin.site.register(views.CommAdminView, GlobalSetting)