from django.shortcuts import render
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework import status
from joblib import delayed
import joblib
import pandas as pd


class MlmodelView2 (APIView):
    def post(self,request,format=None):
        ip_address = request.META.get('REMOTE_ADDR')
        print("IP address : ", ip_address)
        try:
            sp = int(input("Enter The SpO2 Level : "))
            heart_rate_data = int(input("Enter The Heart Rate : "))
            temp = int(input("Enter The Present Skin Temperature : "))
            print(heart_rate_data,temp,sp)
            x_test = pd.DataFrame([[temp,heart_rate_data,sp]], columns=['Temperature','Heart_rate','SPO2'])
            model = joblib.load('main_project_model.pkl')
            y = model.predict(x_test)
            print(*y)
            d = {
                    "Response" : "Valid",
                    "Output" : y[0],
                    "Temp" : temp,
                    "HR" : heart_rate_data,
                    "spo2" : sp
                }
            s = status.HTTP_200_OK
                    
        except Exception as e:
            print(e)
            d = { 'Response' : 'Invalid'}
            s = status.HTTP_406_NOT_ACCEPTABLE

        finally:
            return Response(d,status=s)
