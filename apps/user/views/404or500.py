# -*- coding: utf-8 -*-
from django.shortcuts import render_to_response


def page_not_found(request):
    """
    全局404页面
    """
    response = render_to_response('error_page/404.html', {})
    response.status_code = 404
    return response


def page_error(request):
    """
    全局500页面
    """
    response = render_to_response('error_page/500.html', {})
    response.status_code = 500
    return response