from django import template
from django.template.loader import render_to_string
from django.utils.safestring import mark_safe

register = template.Library()

@register.simple_tag(takes_context=True)
def djmodals_dialogs(context, dlist=None):
    """Initialize app : add hidden dialogs to the page
    """

    dialogs = ['alert','confirm','prompt']

    if isinstance(dlist,str):
        dlist = list(map(lambda s:s.strip().lower(), dlist.split(',')))
    else:
        dlist = dialogs

    out = ''

    for dialog in dlist:
        if dialog in dialogs:
            out += render_to_string(f'django_modals/{dialog}_dialog.html',
                                    context.flatten(), context.request)

    return mark_safe(out)