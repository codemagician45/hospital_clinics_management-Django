from django.db import models

# Create your models here.
from django.db import models
from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.dispatch import receiver

class Accounts(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    username = models.CharField(max_length=100,default='')
    email = models.CharField(max_length=50,default='')
    password = models.CharField(max_length=50,default='')
    first_name = models.CharField(max_length=50,default='')
    last_name = models.CharField(max_length=50,default='')
    birth = models.CharField(max_length=50,default='')
    role = models.CharField(max_length=50,default='')