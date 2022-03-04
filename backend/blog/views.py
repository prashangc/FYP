from rest_framework.views import APIView
from rest_framework.response import Response
from .serializers import *
from rest_framework.permissions import IsAuthenticated
from rest_framework.authentication import TokenAuthentication 
from .models import *
from rest_framework import viewsets, mixins

# Create your views here.
class RegisterUser(APIView):
    def post(self,request):
        serializers = UserSerializers(data=request.data)
        if serializers.is_valid():
            serializers.save()
            return Response({'error': False}) 
        return Response({'error': True}) 


class MedicalNewsImagesViewsList(viewsets.ModelViewSet):    
    queryset = MedicalNewsImageSlider.objects.all() 
    serializer_class = MedicalNewsImagesSerializers    


class HospitalViewsList(APIView):    
    permission_classes = [IsAuthenticated, ]
    authentication_classes = [TokenAuthentication, ]
    queryset = Hospital.objects.all() 
    serializer_class = HospitalSerializers
    def get(self,request):
        query = Hospital.objects.all() 
        serializer = HospitalSerializers(query,many=True, context={'request': request})
        data = []
        for hospital in serializer.data:
            liked = Favourite.objects.filter(hospital=hospital['id']).filter(favourite=True).count() # to count the total number of likes
            favourites = Favourite.objects.filter(hospital=hospital['id']).filter(user=request.user.id).first()
            if favourites:
                hospital['favourite'] = favourites.favourite
            else:
                hospital['favourite'] = False
            hospital['totalFavourite']=liked # to display the total number of likes
            data.append(hospital) 
        return Response(serializer.data)

class AddToFavourite(APIView):
    # queryset = Favourite.objects.all() 
    # serializer_class = FavouriteSerializers
    permission_classes = [IsAuthenticated, ]
    authentication_classes = [TokenAuthentication, ]
    def post(self,request):
        try:
            # query = Favourite.objects.all() 
            # serializer = FavouriteSerializers(query,many=True)
            data=request.data  
            # data = request.data
            # print(data)
            c_user = request.user
            hospital_id = data['id']
            hospital_obj = Hospital.objects.get(id=hospital_id)
            fav_obj = Favourite.objects.filter(hospital=hospital_obj).filter(user=c_user).first()
            if fav_obj:
                old_fav = fav_obj.favourite
                fav_obj.favourite = not old_fav
                fav_obj.save()
            else:
                Favourite.objects.create(
                    hospital = hospital_obj,
                    user = c_user,
                    favourite = True
                )     
            response_msg = {'error': False}
        except:
            response_msg = {'error': True}  
        return Response(response_msg) 
    