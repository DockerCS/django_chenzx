# -*- coding: utf-8 -*-
from django.contrib.auth.decorators import login_required
from django.utils.decorators import method_decorator


class LoginRequiredMixin(object):
    """
    当继承这个类时候，需要登陆才能访问
    """
    @method_decorator(login_required(login_url='/user/login/'))
    def dispatch(self, request, *args, **kwargs):
        return super(LoginRequiredMixin, self).dispatch(request, *args, **kwargs)
