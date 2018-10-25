from django.urls import path
from . import views

urlpatterns = [
    path('codes/', views.CodeList.as_view()),
    path('code/<int:pk>', views.CodeDetailView.as_view()),
]