from django.urls import path, re_path
from . import views

urlpatterns = [
    path('',views.display_clinics),
    path('all', views.get_all),
    re_path(r'^clinic/(?P<slug>[\w-]+)/$',views.get_clinic),
    re_path(r'^clinic/(?P<slug>[\w-]+)/booking/$',views.clinic_booking),
    re_path(r'^clinic/(?P<slug>[\w-]+)/booking/confirmBooking/$',views.confirm_booking)
]
