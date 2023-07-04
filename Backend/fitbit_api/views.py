from django.shortcuts import render
from django.http import HttpResponse, HttpRequest
import requests
import ml_model.views as ml


CLIENT_ID = "23QZGS"
CLIENT_SECRET = "ea47668e0d07b25b9bbf184d25132ffb"
REDIRECT_URI = "http://localhost:5000/callback"
AUTH_BASE64ENCODE = "MjNRWkdTOmVhNDc2NjhlMGQwN2IyNWI5YmJmMTg0ZDI1MTMyZmZi"


def authorize(request):
    authorization_url = f"https://www.fitbit.com/oauth2/authorize?response_type=code&client_id={CLIENT_ID}&scope=activity+cardio_fitness+electrocardiogram+heartrate+location+nutrition+oxygen_saturation+profile+respiratory_rate+settings+sleep+social+temperature+weight"
    return HttpResponse(f"<a href='{authorization_url}'>Authorize Fitbit</a>")

def callback(request:HttpRequest):
    code = request.GET.get("code")
    print(f"ACCESS CODE : {code}")
    # Make a request to Fitbit's token endpoint to exchange the code for an access token
    token_url = "https://api.fitbit.com/oauth2/token"
    payload = {
        "code": code,
        "client_id": CLIENT_ID,
        "grant_type": "authorization_code",
        "redirect_uri": REDIRECT_URI,
    }
    headers = {
        "Content-Type": "application/x-www-form-urlencoded",
        "Authorization": f"Basic {AUTH_BASE64ENCODE}"
    }
    response = requests.post(token_url, data=payload, headers=headers)

    if response.status_code == 200:
        token_data = response.json()
        ml.access_token = token_data["access_token"]
        print(f"ACCESS TOKEN : {ml.access_token}")
        refresh_token = token_data["refresh_token"]
        print(f"REFRESH TOKEN : {refresh_token}")
        #return HttpResponse("Success")

        heart_rate_url = "https://api.fitbit.com/1/user/-/activities/heart/date/2023-06-19/1d.json"
        temp_url = "https://api.fitbit.com/1/user/-/temp/skin/date/2023-06-19.json"    
        headers = {"Authorization": f"Bearer {ml.access_token}"}
        response_heart = requests.get(heart_rate_url, headers=headers)
        response_temp = requests.get(temp_url, headers=headers)

        print(response_heart.status_code,response_temp.status_code)
        if response_heart.status_code == 200 and response_temp.status_code == 200:
            heart_rate_data = response_heart.json()
            heart_rate_data = heart_rate_data['activities-heart-intraday']['dataset']
            temp_data = response_temp.json()
            sk_temp = temp_data["tempSkin"][0]["value"]["nightlyRelative"]
            sk_temp = 32.00 + float(sk_temp)
            #sk_temp = temp_data["tempSkin"]
            return HttpResponse(f"Heart Rate Data: {heart_rate_data} <br><br>Temperature : {sk_temp}")
        else:
            return HttpResponse("Failed to fetch data")

    else:
        return HttpResponse("Failed to retrieve access token")