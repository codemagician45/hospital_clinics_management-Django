from django.http import HttpResponse
from . import views
from . models import Clinics,Booking
from django.shortcuts import render
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_protect
import json


def display_clinics(request):
    return render(request,'search_clinics.html')

def get_clinic(request,slug):
    clinic = Clinics.objects.filter(slug=slug).first()
    booked_clinic = Booking.objects.filter(clinic_id = clinic.id).first()
    try:
        booked_clinic
    except NameError:
        booked_clinic = None
    return render(request,'clinic.html',{'clinic':clinic,'booked_clinic':booked_clinic})

def get_all(request):
    if request.method == 'POST':
       clinics = Clinics.objects.all()
       data = []
       for clinic in clinics:
           # data.append({
           #     'id': clinic.id,
           #     'name':clinic.name,
           #     'slug':clinic.slug,
           #     'address':clinic.address,
           #     'phone':clinic.phone,
           #     'work_time':clinic.work_time,
           #     'longitude':clinic.longitude,
           #     'latitude':clinic.latitude
           # })
            data.append(
                [
                    clinic.id,clinic.name,clinic.slug,clinic.address,clinic.phone,clinic.work_time,clinic.longitude,clinic.latitude
                ]
            )
       # print(type(data))
       # return HttpResponse(data)
       json_data = json.dumps(data)
       return HttpResponse(json_data, content_type='application/json')

def clinic_booking(request,slug):
    clinic = Clinics.objects.filter(slug=slug)
    return render (request,'clinic_booking.html',{'c_booking':clinic})

def confirm_booking(request,slug):
    clinic = Clinics.objects.filter(slug=slug).first()
    clinic_id = clinic.id

    if request.method == 'POST':
        fname = request.POST['fname']
        lname = request.POST['lname']
        email = request.POST['email']
        birthday = request.POST['birth']
        phone = request.POST['phone']
        booking_dateTime = request.POST['datetime']

    booking = Booking()
    booking.fname = fname
    booking.email = email
    booking.lname = lname
    booking.birthday = birthday
    booking.phone = phone
    booking.dateTime = booking_dateTime
    booking.clinic_id = clinic_id
    booking.save()
    data = Booking.objects.latest('created_at')

    clinic1 = Clinics.objects.filter(id = data.clinic_id).first()
    res = []
    res.append([data.id,data.fname,data.lname,data.email,data.dateTime,clinic1.name])
    json_data = json.dumps(res)
    return HttpResponse(json_data, content_type='application/json')
