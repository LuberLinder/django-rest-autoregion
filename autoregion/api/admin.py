from django.contrib import admin
from .models import (
    Lang, Country, Code
)

admin.site.register(Lang)
admin.site.register(Country)

@admin.register(Code)
class CodeAdmin(admin.ModelAdmin):
    list_display = ('id', 'code', 'name', 'country_id', 'lang_id')

#admin.site.register(Code, CodeAdmin)