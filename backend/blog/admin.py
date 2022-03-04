from django.contrib import admin
from .models import *
from django.contrib.auth.admin import UserAdmin

# Register your models here.
class MedicalNewsImageSliderAdmin(admin.ModelAdmin):
    list_display = ['id', 'pictures'] # this will be visible in the admin panel

admin.site.register(MedicalNewsImageSlider, MedicalNewsImageSliderAdmin)
admin.site.register([Hospital, Favourite])



class CustomUserAdmin(UserAdmin):
    model = CustomUser
    list_display = ('pk', 'username', 'email', 'is_patient', 'is_doctor')
    fieldsets = (
        (None, {'fields': ()}),
        ('Permissions', {'fields': ('is_staff', 'is_active'
        , 'is_patient', 'is_doctor')}),
    )
    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': ('username', 'email', 'password1', 'password2',)}
        ),
    )
    # search_fields = ('username', 'email',)
    ordering = ('username', 'email',)

admin.site.register(CustomUser, CustomUserAdmin)

