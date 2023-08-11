"""
URL configuration for proyecto project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from veterinaria.views import login, mostrarPersona, mostrarMascota, registrarPersona, plantillas, crearPersona, crearPersonahtml, inicioVeterinario, login2, inicioVendedor, cerrar_sesion, RegistrarMascota, CrearMascota, error,crearFacturaSINordenHtml,crearFacturaSINorden,ventasinOrdenHtml,RegistrarHistoriaClinica,historiaClinica


urlpatterns = [
    path("admin/", admin.site.urls),
    path('login', login, name='login'),
    path('mostrarPersona/', mostrarPersona, name='mostrarPersona'),
    path('mostrarMascota/', mostrarMascota, name='mostrarMascota'),
    path('plantillas/', plantillas, name='plantillas'),
    path('crearPersona/', crearPersona, name='crearPersona'),
    path('crearPersonahtml/', crearPersonahtml),
    path('cerrar-sesion/', cerrar_sesion, name='cerrar_sesion'),
    path('login2/', login2, name='login2'),
    path('inicioVeterinario/<username>',inicioVeterinario, name='inicioVeterinario'),  
    path('inicioVendedor/<username>', inicioVendedor, name='inicioVendedor'),
    path("registroPersonas/<cedula>/<nombre>/<rol>/<usuario>/<passw>", registrarPersona),
    path('RegistrarMascota/<username>',RegistrarMascota, name='RegistrarMascota'),
    path('CrearMascota/<username>',CrearMascota, name='CrearMascota'),
    path('error/<username>/<error>', error, name='error'),
    
    path('crearFacturaSINordenHtml/<username>',crearFacturaSINordenHtml, name='crearFacturaSINordenHtml'),
    path('crearFacturaSINorden/<username>',crearFacturaSINorden, name='crearFacturaSINorden'),
    
    path('ventasinOrdenHtml/<username>',ventasinOrdenHtml, name='ventasinOrdenHtml'),
    
    path('RegistrarHistoriaClinica/<username>',RegistrarHistoriaClinica, name='RegistrarHistoriaClinica'),
    path('historiaClinica/<username>',historiaClinica, name='historiaClinica'),


]
