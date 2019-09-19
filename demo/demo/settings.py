"""

Django settings for django-modals project.

"""

import os

BASE_DIR = os.path.dirname(os.path.abspath(__file__))

SECRET_KEY = '-- demo --'

DEBUG = True

ALLOWED_HOSTS = ['localhost','127.0.0.1']

INSTALLED_APPS = [
    'django.contrib.staticfiles',
    'django_modals',
    'demo',
]

ROOT_URLCONF = 'demo.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
            ],
        },
    },
]

WSGI_APPLICATION = 'demo.wsgi.application'

DATABASES = {}

STATIC_URL = '/static/'