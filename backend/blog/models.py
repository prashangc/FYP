from django.db import models
# from django.contrib.auth.models import User, 
from django.contrib.auth.models import AbstractUser
from django.utils.translation import gettext_lazy as _

# Create your models here.

class CustomUser(AbstractUser):
    username = models.CharField(max_length =100, unique = True) 
    email = models.EmailField(('Email address'), unique = True)
    
    is_staff = models.BooleanField(default=False)
    is_active = models.BooleanField(default=True)
    
    is_patient = models.BooleanField(default=False)
    is_doctor = models.BooleanField(default=False)
    
    # class Meta:
    #     ordering = ['is_Patient']


class MedicalNewsImageSlider(models.Model):
    pictures = models.ImageField(upload_to="medical_news",blank=True)

class Hospital(models.Model):
    hospital_name = models.CharField(max_length=100)     
    hospital_image = models.ImageField(upload_to="hospitals", blank=True)
    address = models.CharField(max_length=100,blank=True, null=True) 
    hospital_detail = models.TextField(blank=True, null=True)     
    def __str__(self):
        return self.hospital_name  

class Favourite(models.Model):
    user = models.ForeignKey(CustomUser, on_delete=models.CASCADE)
    hospital = models.ForeignKey(Hospital,on_delete=models.CASCADE)
    favourite = models.BooleanField(default=False)

    def __str__(self):
        return f"Hospital={self.hospital.hospital_name} || User={self.user.username} || Favourite={self.favourite}"

        