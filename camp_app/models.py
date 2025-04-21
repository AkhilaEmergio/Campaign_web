from django.db import models

# Create your models here.
class know_more(models.Model):
    name=models.CharField(max_length=100)
    email=models.EmailField(max_length=100)
    phone=models.CharField(max_length=15)
    country=models.CharField(max_length=100)
    state=models.CharField(max_length=100)
    
    def __str__(self):
        return self.name
    
