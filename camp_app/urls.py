from django.urls import path
from .views import *

urlpatterns = [
    path('know_more/', KnowMoreView.as_view(), name='know_more'),
]