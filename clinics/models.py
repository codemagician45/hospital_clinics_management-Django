from django.db import models

# Create your models here.
class Clinics(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=100)
    slug = models.CharField(max_length=100)
    address = models.CharField(max_length=100)
    phone = models.CharField(max_length=25)
    work_time =models.CharField(max_length=100)
    longitude = models.FloatField(max_length=20)
    latitude = models.FloatField(max_length=20)
    image = models.ImageField(default='default.png', blank=True)

class Booking(models.Model):
    id = models.AutoField(primary_key=True)
    fname = models.CharField(max_length=100, default='')
    lname = models.CharField(max_length=100)
    email = models.CharField(max_length=100)
    birthday = models.CharField(max_length=100, default='')
    phone = models.CharField(max_length=100, default='')
    dateTime = models.CharField(max_length=20)
    clinic_id = models.IntegerField()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    # clinic = models.ForeignKey(Clinics,on_delete=models.CASCADE,related_name='students')
    clinic_name = models.CharField(max_length=100)
    clinic_link = models.CharField(max_length=100)
    status = models.CharField(max_length=20)
    notification_close = models.IntegerField(default=0)
    bookedfrom = models.IntegerField()
