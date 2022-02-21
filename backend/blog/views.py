from rest_framework.views import APIView
from rest_framework.response import Response
from .serializers import *
from rest_framework import viewsets
from rest_framework.permissions import IsAuthenticated
from rest_framework.authentication import TokenAuthentication 
from .models import MedicalNewsImageSlider, Hospital

# Create your views here.

class RegisterDoctor(APIView):
    def post(self,request):
        serializers = PatientSerializers(data=request.data)
        if serializers.is_valid():
            serializers.save()
            return Response({'error': False}) 
        return Response({'error': True}) 
    

class MedicalNewsImagesViewsList(viewsets.ModelViewSet):    
    queryset = MedicalNewsImageSlider.objects.all() 
    serializer_class = MedicalNewsImagesSerializers    


class HospitalViewsList(viewsets.ModelViewSet):    
    queryset = Hospital.objects.all() 
    serializer_class = HospitalSerializers    