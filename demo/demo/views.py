#
# Created : 2019-09-18
#
# @author: Eric Lapouyade
#

from django.views.generic import TemplateView

class IndexView(TemplateView):
    template_name = 'demo/index.html'

class NoBSView(TemplateView):
    template_name = 'demo/nobs.html'