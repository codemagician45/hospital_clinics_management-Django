from django.http import HttpResponse
from accounts.models import Accounts
from . models import Clinics,Booking
from django.shortcuts import render
import json

def display_clinics(request):
    return render(request,'search_clinics.html')

# before booking : display book button
def get_clinic(request,slug):
    clinic = Clinics.objects.filter(slug=slug).first()
    if request.user.id:
        current_user = request.user
        booked_clinic = Booking.objects.filter(clinic_id = clinic.id,bookedfrom=current_user.id).first()
        try:
            booked_clinic
        except NameError:
            booked_clinic = None
        current_user_role = Accounts.objects.filter(user_id=current_user.id).first()
        if current_user_role:
            role = current_user_role.role
        if current_user.first_name:
            role = '2'
        if role:
            return render(request,'clinic.html',{'clinic':clinic,'booked_clinic':booked_clinic,'role':role})
    else:
        return render(request, 'clinic.html',
                      {'clinic': clinic})

# getting all clinics data for clinic displaying
def get_all(request):
    if request.method == 'POST':
       clinics = Clinics.objects.all()
       data = []
       for clinic in clinics:
            data.append(
                [
                    clinic.id,clinic.name,clinic.slug,clinic.address,clinic.phone,clinic.work_time,clinic.longitude,clinic.latitude
                ]
            )
       json_data = json.dumps(data)
       return HttpResponse(json_data, content_type='application/json')

# booking page
def clinic_booking(request,slug):
    clinic = Clinics.objects.filter(slug=slug).first()
    current_user = request.user
    current_user_field = Accounts.objects.filter(user_id=current_user.id).first()
    if current_user_field:
        patient_field = current_user_field
    if current_user.first_name:
        patient_field = current_user
    # print(patient_field.first_name)
    if patient_field:
        return render(request, 'clinic_booking.html', {'c_booking': clinic,'current_user':patient_field})
    else:
        return render (request,'clinic_booking.html',{'c_booking':clinic})

# booking confirm alert
def confirm_booking(request,slug):
    current_user = request.user
    clinic = Clinics.objects.filter(slug=slug).first()
    clinic_id = clinic.id
    clinic_name = clinic.name
    clinic_link = clinic.slug
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
    booking.clinic_name = clinic_name
    booking.bookedfrom = current_user.id
    booking.clinic_link = clinic_link
    booking.save()
    data = Booking.objects.latest('created_at')

    clinic1 = Clinics.objects.filter(id = data.clinic_id).first()
    res = []
    res.append([data.id,data.fname,data.lname,data.email,data.dateTime,clinic1.name])
    json_data = json.dumps(res)
    return HttpResponse(json_data, content_type='application/json')

# booking list
def get_AllBooking(request):
    allbooks = Booking.objects.all()
    current_user = request.user
    current_user_role = Accounts.objects.filter(user_id=current_user.id).first()
    # if user doctor or patient
    if current_user_role:
        return render(request,'booking.html',{'all':allbooks,'role':current_user_role.role})
    else:
        return render(request, 'booking.html', {'all': allbooks})

# set booking permission

def set_booking_permission(request):
    if request.method == 'POST':
        Booking.objects.filter(id=request.POST['book_id']).update(status=request.POST['status'])
        updated_booking = Booking.objects.filter(id=request.POST['book_id']).first()
        # print(updated_booking.id)
        return HttpResponse(updated_booking.id)

def send_notification(request):
    notificated_id = []
    booksID = []
    role = ''
    if request.user.id:
        current_user_role = Accounts.objects.filter(user_id=request.user.id).first()
        if current_user_role:
            role = current_user_role.role
        if role == '2' or request.user.first_name:
            if request.method == 'POST':
                res =[]
                notificated_id = request.POST.getlist('notificated[]')
                results = list(map(int, notificated_id))
                mybooks = Booking.objects.filter(bookedfrom=request.user.id)
                for mybook in mybooks:
                    booksID.append(mybook.id)
                rest = [item for item in booksID if item not in results]
                rest_mybooks = Booking.objects.filter(pk__in=rest)
                # print(rest_mybooks)
                if rest_mybooks:
                    for mybook in rest_mybooks:
                        if mybook.status != '':
                            res.append([mybook.clinic_name,mybook.status,mybook.id,mybook.clinic_link,mybook.notification_close])
                            json_data = json.dumps(res)
                        else:
                            res.append([mybook.clinic_name])
                            json_data = json.dumps(res)
                    return HttpResponse(json_data, content_type='application/json')
                return HttpResponse("no notification anymore")
        else:
            return HttpResponse("not allowed")
    else:
        return HttpResponse("not allowed")

def notification_close(request):
    if request.method == 'POST':
        if request.POST['id']:
            notification_close = Booking.objects.filter(id=request.POST['id']).update(notification_close=1)
            return HttpResponse(notification_close)

# def notificated(request):
#     if request.method == 'POST':
#         if request.POST['id']:
#             notificated_book = Booking.objects.filter(id=request.POST['id']).update(notificated=1)
#             return HttpResponse(notificated_book)





