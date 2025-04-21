from rest_framework import serializers
from .models import *

class KnowMoreSerializer(serializers.ModelSerializer):
    class Meta:
        model = know_more
        fields = '__all__'