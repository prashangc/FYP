from django.db import models
from django.contrib.auth.models import User

# Create your models here.

class MedicalNewsImageSlider(models.Model):
    pictures = models.ImageField(upload_to="medical_news",blank=True)
       
class Hospital(models.Model):
    hospital_name = models.CharField(max_length=100)     
    hospital_image = models.ImageField(upload_to="hospitals", blank=True)
    hospital_detail = models.TextField(blank=True, null=True)     
    def __str__(self):
        return self.hospital_name  
