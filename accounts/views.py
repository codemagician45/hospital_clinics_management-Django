from django.shortcuts import render, redirect
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm
from django.contrib.auth import login, logout, authenticate
from django.contrib import messages
from django.contrib.auth.models import User
from .models import Accounts

def register(request):
    if request.method == 'POST':
        username = request.POST.get("username")
        password = request.POST.get("password")
        if User.objects.filter(username=username).exists():
            ctx = {
                'error': 1
            }
            return render(request, 'reg_form.html', ctx)
        else:
            account = Accounts()
            user = User.objects.create_user(username=username, password=password)
            user.save()
            account.user = user
            account.username = request.POST.get("username")
            account.email = request.POST.get("email")
            account.firstName = request.POST.get("firstName")
            account.lastName = request.POST.get("lastName")
            account.password = request.POST.get("password")
            account.birth = request.POST.get("birth")
            account.role = request.POST.get("role")
            account.save()
            if(account.role == '1'):
                messages.success(request, f"New Doctor Account created: {username}")
                messages.info(request,f"You are now log in {username}")
            if(account.role == '2'):
                messages.success(request, f"New Patient Account created: {username}")
                messages.info(request, f"You are now log in {username}")

            login(request,user)
            return redirect('/')
    else:
        return render(request, 'reg_form.html')


# def login_request(request):
#     if request.method == 'POST':
#         form = AuthenticationForm(request=request, data=request.POST)
#         if form.is_valid():
#             username = form.cleaned_data.get('username')
#             password = form.cleaned_data.get('password')
#             user = authenticate(username=username, password=password)
#             if user is not None:
#                 login(request, user)
#                 messages.info(request, f"You are now logged in as {username}")
#                 return redirect('/')
#             else:
#                 messages.error(request, "Invalid username or password.")
#         else:
#             messages.error(request, "Invalid username or password.")
#     form = AuthenticationForm()
#     return render(request=request,
#                   template_name="login_form.html",
#                   context={"form": form})

def login_request(request):
    if request.method == 'POST':
        username = request.POST.get("username")
        password = request.POST.get("password")
        user = authenticate(username=username, password=password)
        if user is not None:
            login(request, user)
            messages.info(request, f"You are now logged in as {username}")
            return redirect('/')
        else:
            messages.error(request, "Invalid username or password.")
            return render(request, 'login_form.html')
    else:
        return render(request,'login_form.html')

def logout_request(request):
    logout(request)
    messages.info(request,"Logged out successfully!")
    return redirect("/")
