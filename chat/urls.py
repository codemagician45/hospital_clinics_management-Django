from django.conf.urls import url
from django.urls import path, re_path
from . import views

urlpatterns = [
    # url('upload/',views.upload, name='upload'),
    re_path(r'^upload/(?P<slug>[\w-]+)/$',views.upload, name='upload'),
    url('download/',views.download, name='download'),

]