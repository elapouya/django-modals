#
# Created : 2018-02-16
#
# @author: Eric Lapouyade
#

from django.urls import path
from .views import *

urlpatterns = [
    path('', IndexView.as_view(), name='index'),
    path('nobs', NoBSView.as_view(), name='nobs'),
]