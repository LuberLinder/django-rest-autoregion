from django.db import models
from django.contrib.postgres.fields import ArrayField

class Lang(models.Model):
    def __str__(self):
        return self.name

    code = models.CharField(max_length=10)
    name = models.TextField(default='')

class Country(models.Model):
    def __str__(self):
        return self.name
            
    name = models.TextField(default='')
    parent = models.ForeignKey('self', on_delete=models.CASCADE, null=True, blank=True)
    lang = models.ForeignKey(Lang, on_delete=models.CASCADE)

class Code(models.Model):
    def __str__(self):
        return f'{self.code} {self.name} {self.lang_id}'
        
    code = models.CharField(max_length=10)
    name = models.TextField(default='')
    country = models.ForeignKey(Country, on_delete=models.CASCADE)
    lang = models.ForeignKey(Lang, on_delete=models.CASCADE, related_name='+')
    #parent_id = models.ForeignKey('self', on_delete=models.CASCADE, related_name='+', null=True, blank=True)
    orig_name = models.TextField(blank=True)
    cities = ArrayField(models.TextField(), size=1,)
    
    class Meta:
        ordering = ['code']
