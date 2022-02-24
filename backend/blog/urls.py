from django.urls import path, include
from .views import *
from rest_framework import routers
from rest_framework.authtoken.views import obtain_auth_token

route = routers.DefaultRouter()
route.register('images', MedicalNewsImagesViewsList)
# route.register('hospitals', HospitalViewsList)
route.register('favourite', AddToFavourite)




urlpatterns = [
    path('login/', obtain_auth_token),
    path('registerDoctor/', RegisterDoctor.as_view()),
    # path('favourite/', AddToFavourite.as_view()),
    path('hospitals/', HospitalViewsList.as_view()),
    # path('images/', MedicalNewsImagesViewsList.as_view()),
    path('', include(route.urls)),
    # path('', include(route.urls)),


]