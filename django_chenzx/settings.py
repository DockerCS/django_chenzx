"""
Django settings for django_chenzx project.

Generated by 'django-admin startproject' using Django 1.10.7.

For more information on this file, see
https://docs.djangoproject.com/en/1.10/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/1.10/ref/settings/
"""

import os
import sys

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(BASE_DIR, 'apps'))
sys.path.insert(0, os.path.join(BASE_DIR, 'extra_apps'))


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/1.10/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'n5^@sx4-_d!1p2$vb%b@x%n4$1(gsgeryb-a9o0p&vx3*2hx^t'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = False

ALLOWED_HOSTS = ['*']

AUTHENTICATION_BACKENDS = (
    'user.views.useradd.CustomBackend',
    # 第三方登录
    'social_core.backends.github.GithubOAuth2',
    'social_core.backends.weibo.WeiboOAuth2',
    'social_core.backends.qq.QQOAuth2',
    'social_core.backends.weixin.WeixinOAuth2',
    'django.contrib.auth.backends.ModelBackend',
)

# Application definition
INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'django.contrib.sites',
    # 第三方APP
    'xadmin',
    'haystack',
    'crispy_forms',  # xadmin的依赖包, pip3 install django-crispy-forms
    # 'captcha',  # 验证码
    'DjangoUeditor',
    'social_django',  # 第三方登录支持
    'django_comments',
    'django_comments_xtd',
    'raven.contrib.django.raven_compat',  # sentry支持
    'anymail',  # 发送邮件
    'notifications',  # 消息通知
    # MyApp
    'user',
    'post',
    'category',
    'tools',
    'me',
]

# 评论相关设置
COMMENTS_APP = 'django_comments_xtd'
SITE_ID = 1
COMMENTS_XTD_CONFIRM_EMAIL = False
COMMENTS_XTD_MAX_THREAD_LEVEL = 2
COMMENTS_XTD_MAX_THREAD_LEVEL_BY_APP_MODEL = {
    'projects.release': 2,
    'post.stories': 8,
    'post.quotes': 8,
    'post.diarydetail': 0  # not required as it defaults to COMMENTS_XTD_MAX_THREAD_LEVEL
}
COMMENTS_XTD_APP_MODEL_OPTIONS = {
    'post.article': {
        'allow_flagging': True,
        'allow_feedback': True,
        'show_feedback': True,
    },
    'me.guesbook': {
        'allow_flagging': True,
        'allow_feedback': True,
        'show_feedback': True,
    }
}
COMMENTS_XTD_LIST_ORDER = ('-thread_id', 'order')  # 评论排序

HAYSTACK_CONNECTIONS = {
    'default': {
        'ENGINE': 'apps.post.whoosh_cn_backend.WhooshEngine',
        'PATH': os.path.join(BASE_DIR, 'whoosh_index'),  # 指定索引文件的存放位置
    },
}
HAYSTACK_SEARCH_RESULTS_PER_PAGE = 10  # 搜索结果每页显示10项
# HAYSTACK_SIGNAL_PROCESSOR是指定什么时候更新索引
HAYSTACK_SIGNAL_PROCESSOR = 'haystack.signals.RealtimeSignalProcessor'
HAYSTACK_CUSTOM_HIGHLIGHTER = 'tools.utils.utils.Highlighter'  # 搜索词高亮

AUTH_USER_MODEL = "user.UserProfile"  # 拓展user表后，需要在settings.py中加入

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

real_ip = 'tools.views.http.SetRemoteAddrFromForwardedFor'
ROOT_URLCONF = 'django_chenzx.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [os.path.join(BASE_DIR, 'templates')],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
                'django.template.context_processors.media',  # django1.7及之前版本是：django.core.context_processors.media
                # 第三方登录
                'social_django.context_processors.backends',
                'social_django.context_processors.login_redirect',
                # 自定义模版全局变量(默认变量)
                'django_chenzx.global_variable.like_or_not',  # 点赞
                'django_chenzx.global_variable.user_recommend',  # 用户推荐
            ],
        },
    },
]

WSGI_APPLICATION = 'django_chenzx.wsgi.application'

# Database
# https://docs.djangoproject.com/en/1.10/ref/settings/#databases
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'chenzx',
        'USER': 'root',
        'PASSWORD': 'password',
        'HOSTS': '',
        'PORT': '',
        # 'OPTIONS': {'init_command': 'SET storage_engine=INNODB;'}
    }
}

# Password validation
# https://docs.djangoproject.com/en/1.10/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


# Internationalization
# https://docs.djangoproject.com/en/1.10/topics/i18n/

LANGUAGE_CODE = 'zh-hans'  # 设置默认语言为中文简体

TIME_ZONE = 'Asia/Shanghai'  # 设置时间为中国时间

USE_I18N = True

USE_L10N = True

USE_TZ = False


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/1.10/howto/static-files/
# 静态文件位置
STATIC_URL = '/static/'
STATIC_ROOT = os.path.join(BASE_DIR, 'static')
# STATICFILES_DIRS = (
#     os.path.join(BASE_DIR, 'static'),
# )

# 媒体文件或者上传文件位置
MEDIA_URL = '/media/'
MEDIA_ROOT = os.path.join(BASE_DIR, 'media')

# anymail发送邮件
ANYMAIL = {
    "SENDGRID_API_KEY": "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",
    # "MAILGUN_SENDER_DOMAIN": 'mg.example.com',  # your Mailgun domain, if needed
}
EMAIL_BACKEND = "anymail.backends.sendgrid.EmailBackend"  # or sendgrid.EmailBackend, or...
DEFAULT_FROM_EMAIL = "夕象陈志祥的个人博客 <chenzx.name>"
# EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'
# EMAIL_HOST = 'ssl://smtp.163.com'  # 采用新浪邮箱发送邮件，由于阿里云采用ssl的465端口
# EMAIL_PORT = 465
# EMAIL_HOST_USER = 'chenzhixiang1992@163.com'
# EMAIL_HOST_PASSWORD = 'wbhzydrefd1314'
# EMAIL_USE_SSL = True
# EMAIL_FROM = 'chenzhixiang <chenzhixiang1992@163.com>'

# 登录注册之后跳转设置
SOCIAL_AUTH_LOGIN_REDIRECT_URL = '/user/social_bind/'  # 第三方登录成功后跳转到首页
# 好像这个设置暂时没有起到作用，参考：http://zmrenwu.com/post/47/
# LOGOUT_REDIRECT_URL = '/'  # 自带用户系统，如果没有记录到登出前页面，登出成功后跳转到首页
# LOGIN_REDIRECT_URL = '/'  # 自带用户系统，如果没有记录到登录前页面，登录成功后跳转到首页

# GitHub的KEY和SECRET设置
SOCIAL_AUTH_GITHUB_KEY = '40350614269c1f590b0e'
SOCIAL_AUTH_GITHUB_SECRET = '89b3a4480fc7713f22216bfa3cb17c76601e7829'

# WEIBO的KEY和SECRET设置
SOCIAL_AUTH_WEIBO_KEY = '3890838316'
SOCIAL_AUTH_WEIBO_SECRET = '05a084883f6236fd76eb3e08a9e1a1aa'

# WEIBO的KEY和SECRET设置
SOCIAL_AUTH_QQ_KEY = '1106459858'
SOCIAL_AUTH_QQ_SECRET = 'v6Gt4ie4ujVuuRYC'

SOCIAL_AUTH_USERNAME_IS_FULL_EMAIL = True

# social_auth拓展
# SOCIAL_AUTH_PIPELINE = (
#     'social_core.pipeline.social_auth.social_details',
#     'social_core.pipeline.social_auth.social_uid',
#     'social_core.pipeline.social_auth.auth_allowed',
#     'social_core.pipeline.social_auth.social_user',
#     'social_core.pipeline.user.get_username',
#     'social_core.pipeline.user.create_user',
#     # 'user.views.social_auth.save_userprofile',  # <--- set the path to the function
#     'social_core.pipeline.social_auth.associate_user',
#     'social_core.pipeline.social_auth.load_extra_data',
#     'social_core.pipeline.user.user_details',
# )

# sentry在线管理bug
RAVEN_CONFIG = {
    'dsn': 'http://d1c59ea0e6e8441d862699d753f24113:55ce97e1fc0e455ab3ff41177b71ed63@101.200.49.120:9000/2',
}