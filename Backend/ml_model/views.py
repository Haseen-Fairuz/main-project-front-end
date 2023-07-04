from ml_model.serializers import MlmodelSerializers
from django.shortcuts import render
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework import status
from joblib import delayed
import joblib
import pandas as pd
import requests

access_token = ""
i=1

class MlmodelView (APIView):
    def post(self,request,format=None):
        try:
            global access_token
            global i
            heart_rate_url = "https://api.fitbit.com/1/user/-/activities/heart/date/2023-06-19/1d.json"
            temp_url = "https://api.fitbit.com/1/user/-/temp/skin/date/2023-06-19.json"
            headers = {"Authorization": f"Bearer {access_token}"}
            serializer = MlmodelSerializers(data=request.data)
            print(access_token)
            ip_address = request.META.get('REMOTE_ADDR')
            print("IP address:", ip_address)
            if(serializer.is_valid()):
                sp = serializer.data['spo2']
                response1 = requests.get(temp_url, headers=headers)
                response2 = requests.get(heart_rate_url, headers=headers)
                print(response1.status_code,response2.status_code)
                if response1.status_code == 200 and response2.status_code == 200:
                    heart_rate_data = response2.json()
                    heart_rate_data = heart_rate_data['activities-heart-intraday']['dataset'][-i]["value"]
                    temp = response1.json()
                    temp = temp["tempSkin"][0]["value"]["nightlyRelative"]
                    temp = 32.00 + float(temp)
                    i-=1
                else:
                    raise Exception
                print(heart_rate_data,temp,sp)
                x_test = pd.DataFrame([[temp,heart_rate_data,sp]], columns=['Temperature','Heart_rate','SPO2'])
                model = joblib.load('main_project_model.pkl')
                y = model.predict(x_test)
                print(*y)
                d = {
                        "Response" : "Valid",
                        "Output" : y[0],
                        "Temp" : temp,
                        "HR" : heart_rate_data
                    }
                s = status.HTTP_200_OK
            else:
                raise Exception
        
        except Exception as e:
            print(e)
            d = {'Response' : 'Invalid'}
            s = status.HTTP_406_NOT_ACCEPTABLE

        finally:
            return Response(d,status=s)