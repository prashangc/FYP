from rest_framework import serializers
from .models import *
from django.contrib.auth import get_user_model
from rest_framework.authtoken.models import Token

Patient = get_user_model()
# Doctor = get_user_model()

class PatientSerializers(serializers.ModelSerializer):
    class Meta:
        model = Patient
        fields = ('id', 'username', 'email', 'password')
        extra_kwargs = {'password': {"write_only":True, 'required': True}}
    def create(self, validated_data):
        user = Patient.objects.create_user(**validated_data)      
        Token.objects.create(user=user)
        return user 

#Image Slider
class MedicalNewsImagesSerializers(serializers.ModelSerializer):
    class Meta:
        model = MedicalNewsImageSlider
        fields = "__all__"

#List of Hospitals
class HospitalSerializers(serializers.ModelSerializer):
    class Meta:
        model = Hospital
        fields = "__all__"



# class UserSerializers(serializers.ModelSerializer):
#     class Meta:
#         model = User
#         fields = ('id', 'username', 'email', 'password')
#         extra_kwargs = {'password': {"write_only":True, 'required': True}}
#     def create(self, validated_data):
#         user = User.objects.create_user(**validated_data)      
#         Token.objects.create(user=user)
#         return user         