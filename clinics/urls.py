from django.urls import path, re_path
from . import views
app_name = 'clinics'
urlpatterns = [
    path('',views.display_clinics, name="map"),
    path('all', views.get_all),
    re_path(r'^clinic/(?P<slug>[\w-]+)/$',views.get_clinic),
    re_path(r'^clinic/(?P<slug>[\w-]+)/booking/$',views.clinic_booking),
    re_path(r'^clinic/(?P<slug>[\w-]+)/booking/confirmBooking/$',views.confirm_booking),
    path('booking',views.get_AllBooking),
    path('booking_permission',views.set_booking_permission),
    path('booking_notification',views.send_notification),
    path('booking_state_update',views.notification_close),
    # path('booking_notificated',views.notificated),

]
