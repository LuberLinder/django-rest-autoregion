from rest_framework import serializers
from api.models import (Lang, Country, Code)


class LangSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = Lang
        fields = '__all__'
        
class CountrySerializer(serializers.ModelSerializer):
    
    class Meta:
        model = Country
        fields = '__all__'
        
class CodeSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = Code
        fields = '__all__'