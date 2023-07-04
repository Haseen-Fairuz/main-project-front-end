from rest_framework import serializers

class MlmodelSerializers(serializers.Serializer):
    spo2 = serializers.CharField()