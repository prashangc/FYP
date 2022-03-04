from rest_framework import serializers
from .models import *
# from django.contrib.auth import get_user_model
from rest_framework.authtoken.models import Token

# Account = get_user_model()

class UserSerializers(serializers.ModelSerializer):
    class Meta:
        model = CustomUser
        fields = ('id', 'username', 'email', 'password')
        extra_kwargs = {'password': {"write_only":True, 'required': True}}
    def create(self, validated_data):
        user = CustomUser.objects.create_user(**validated_data)      
        Token.objects.create(user=user)
        return user 

#Image Slider
class MedicalNewsImagesSerializers(serializers.ModelSerializer):
    class Meta:
        model = MedicalNewsImageSlider
        fields = "__all__"

# class CustomUserSerializers(serializers.ModelSerializer):
#     class Meta:
#         model = CustomUser
#         fields = "__all__"        

#List of Hospitals
class HospitalSerializers(serializers.ModelSerializer):
    class Meta:
        model = Hospital
        fields = "__all__"
        depth = 1

class FavouriteSerializers(serializers.ModelSerializer):
    # members = serializers.SerializerMethodField()
    class Meta:
        model = Favourite
        # fields = "__all__"
        fields = ('id', 'favourite', 'hospital')
        depth = 1
      