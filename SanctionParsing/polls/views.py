import datetime
from django.shortcuts import render
from django.http import HttpResponse

# Create your views here.

def index(request):
    now = datetime.datetime.now()
    return HttpResponse(f"Hello, {name}!")