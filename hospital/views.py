from django.http import HttpResponse
from django.shortcuts import render

def index(request):
    return render(request,'home.html')

def AllBooking(request):
    return render(request,'booking.html')

def getAllBooking(request):
    return HttpResponse("dddd")