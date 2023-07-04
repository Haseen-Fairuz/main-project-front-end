from django.urls import path

from . import views

urlpatterns = [
    path("", views.authorize, name="authorize"),
    path("callback/", views.callback, name="callback"),
]