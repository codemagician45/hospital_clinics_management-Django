from django.shortcuts import render
from django.http import HttpResponse
from clinics.models import Booking
from accounts.models import Accounts
from .models import Chat
import json
from .forms import ChatForm
def Remove(duplicate):
    final_list = []
    for num in duplicate:
        if num not in final_list:
            final_list.append(num)
    return final_list

# Create your views here.
def upload(request,slug):

    # allbooks = Booking.objects.all()
    # get booked patient Ids
    # booked_users_duplicate = []
    # for book in allbooks:
    #     booked_users_duplicate.append([book.bookedfrom,book.fname,book.lname])
    # booked_users = Remove(booked_users_duplicate)
    booked_patient = Booking.objects.filter(bookedfrom=slug).first()
    if request.method == 'POST':
        chats = Chat()
        if request.POST['content']:
            chats.content = request.POST['content']
        else:
            chats.content = ''
        if request.FILES:
            chats.file = request.FILES['document']
            # chats.user_id = request.POST['booked_patient']
            chats.user_id = slug
            chats.save()
            sended_data = Chat.objects.latest('created_at')
            res = []
            res.append([sended_data.content,sended_data.file.url,sended_data.file.name,sended_data.created_at.strftime('%H:%M:%S')])
            json_data = json.dumps(res)
            return HttpResponse(json_data, content_type='application/json')
        else:
            # chats.user_id = request.POST['booked_patient']
            chats.user_id = slug
            chats.save()
            sended_data = Chat.objects.latest('created_at')
            res = []
            res.append([sended_data.content,sended_data.created_at.strftime('%H:%M:%S')])
            json_data = json.dumps(res)
            return HttpResponse(json_data, content_type='application/json')
    return render(request,'doctor_side_send.html',{'booked_user':booked_patient})

def download(request):
    received_data = Chat.objects.filter(user_id=request.user.id).last()
    if received_data:
        if request.method == 'POST':
            res = []
            if received_data.file:
                res.append([received_data.id,received_data.content,received_data.file.url,received_data.file.name,received_data.created_at.strftime('%H:%M:%S')])
                json_data = json.dumps(res)
                return HttpResponse(json_data, content_type='application/json')
            else:
                res.append([received_data.id,received_data.content,received_data.created_at.strftime('%H:%M:%S')])
                json_data = json.dumps(res)
                return HttpResponse(json_data, content_type='application/json')
        else:
            return render(request, 'patient_side_receive.html', {'last_data': received_data})
    else:
        return render(request,'patient_side_receive.html')

