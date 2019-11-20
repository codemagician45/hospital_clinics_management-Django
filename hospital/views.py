from django.shortcuts import render
from accounts.models import Accounts
from django.http import HttpResponse
def index(request):
    role = ''
    if request.user.id:
        current_user = request.user
        current_user_role = Accounts.objects.filter(user_id=current_user.id).first()
        if current_user_role:
            role = current_user_role.role
        if current_user.first_name:
            role = '2'
        if role:
            return render(request, 'home.html', {'role': role})
        else:
            return render(request, 'home.html')
    else:
        return render(request,'home.html')


def procedure(request):
    return render(request,"procedures.html")
