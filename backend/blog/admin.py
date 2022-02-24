from django.contrib import admin
from .models import *

# Register your models here.
# class MedicalNewsImageSliderAdmin(admin.ModelAdmin):
    # list_display = ['id', 'pictures'] # this will be visible in the admin panel

# class HospitalsAdmin(admin.ModelAdmin):
#     list_display = ['id', 'hospital_name', 'hospital_image', 'hospital_detail'] 

# class FavouriteAdmin(admin.ModelAdmin):
#     list_display = ['id', 'hospital', 'user', 'favourite'] 


# admin.site.register(MedicalNewsImageSlider, MedicalNewsImageSliderAdmin)
# admin.site.register(Hospital, HospitalsAdmin)
admin.site.register([Favourite, Hospital, MedicalNewsImageSlider])

# admin.site.register(Favourite, FavouriteAdmin)

