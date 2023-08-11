from audioop import reverse
from multiprocessing import AuthenticationError
from django.contrib.auth.forms import AuthenticationForm

from django.shortcuts import render,redirect

from django.contrib.auth import authenticate, login
from django.contrib import messages


from django.http import JsonResponse, request,HttpResponse

from .models import persona, mascota, facturaSINorden
from .controller.controllerInputs import validarCrearPersona,validarMascota,validarCrearFacturaSINorden,ValidarRegistrar_historia_clinica
from .controller.controllerInputs import validarlogin



# Create your views here.

#ESTE METODO FUE DE PRUEBA DE CLASE
def registrarPersona(request,cedula,nombre,rol,usuario,passw):
    personas=persona()
    personas.cedula=int(cedula)
    personas.nombre=nombre
    personas.rol=rol
    if(rol!="Veterinario" and rol!="Vendedor" and rol!="veterinario" and rol!="vendedor" and rol!="Veterinaria" and rol!="Vendedora" and rol!="veterinaria" and rol!="vendedora"):
        personas.usuario=None
        personas.contraseña=None
    else:
        personas.usuario=usuario
        personas.contraseña=passw
    personas.save()
    return HttpResponse("se ha registrado a " + str(nombre))
#CIERRA METODO



def login(request):
    personas=persona.objects.all()
    contexto= {
        'personas': personas
    }
    return render(request,'login.html', contexto)

def plantillas(request):
    personas=persona.objects.all()
    contexto= {
        'personas': personas
    }
    return render(request,'plantillas.html', contexto)



def mostrarPersona(request):
    personas=persona.objects.all()
    contexto= {
        'personas': personas
    }
    return render(request,'mostrarPersona.html',contexto)

def mostrarMascota(request):
    mascotas=mascota.objects.all()
    contexto= {
        'mascotas': mascotas
    }
    return render(request,'mostrarMascota.html', contexto)

def crearPersonahtml(request):
    return render(request,"crearPersona.html")


def error(request,username,error):
    user=persona.objects.get(usuario=username)
    contexto={"usuario":user,
            "error_message":error}
    return render(request,"error.html",contexto)

def login2(request):
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        
        validar = validarlogin(username, password)
        
        if validar == "VETERINARIO":
            return redirect("/inicioVeterinario/"+username)
        
        elif validar == "VENDEDOR" or validar == "VENDEDORA":
            return redirect("/inicioVendedor/"+username)
        
        messages.error(request, 'Las credenciales son incorrectas')
    return render(request, 'login.html')

def crearPersona(request):
    try:
        cedula=request.GET["cedula"]
        nombre=request.GET["nombre"]
        rol=request.GET["rol"]
        usuario=request.GET["usuario"]
        contraseña=request.GET["contraseña"]\

        rol=rol.upper()
        validarCrearPersona(cedula,nombre,rol,usuario,contraseña)
        
        
        messages.error(request, " :) se ha registrado a " + str(nombre))
        return render(request, 'login.html')

    except Exception as error:
        return render(request, 'error.html', {'error_message': str(error)})


def CrearMascota(request,username):
    try:
        id=request.GET["id"]
        nombre=request.GET["nombre"]
        cedula_dueno=request.GET["cedula_dueno"]
        edad=request.GET["edad"]
        especie=request.GET["especie"]
        raza=request.GET["raza"]
        caracteristicas=request.GET["caracteristicas"]
        peso=request.GET["peso"]

        validarMascota(id, nombre, cedula_dueno, edad, especie, raza, caracteristicas, peso)
        veterinario = persona.objects.get(usuario=username)
        
        messages.error(request, " se ha registrado a la mascota:  " + str(nombre))
        return render(request, 'RegistrarMascota.html', {"veterinario": veterinario})

    except Exception as error:
        return redirect("/error/"+username+"/"+str(error))

def crearFacturaSINorden(request,username):

    try:
        idFactura=request.GET["idFactura"]
        idCliente=request.GET["idCliente"]
        nombreProducto=request.GET["nombreProducto"]
        valor=request.GET["valor"]
        cantidad=request.GET["cantidad"]

        Factura=validarCrearFacturaSINorden(idFactura,idCliente,nombreProducto,valor,cantidad)
        vendedor = persona.objects.get(usuario=username)
        

        return render(request, 'ventasinOrden.html', {"vendedor": vendedor, "Factura":Factura})

    except Exception as error:
        
        return redirect("/error/"+username+"/"+str(error))




def cerrar_sesion(request):
    return redirect('login')  # Redirige a la página de inicio de sesión

def inicioVeterinario(request, username):
    veterinario = persona.objects.get(usuario=username)
    return render(request, 'inicioVeterinario.html', {"veterinario": veterinario})

def inicioVendedor(request,username):
    vendedor = persona.objects.get(usuario=username)
    return render(request,'inicioVendedor.html',{"vendedor": vendedor})


def RegistrarMascota(request,username):
    veterinario = persona.objects.get(usuario=username)
    return render(request,'RegistrarMascota.html', {"veterinario": veterinario})


def crearFacturaSINordenHtml(request,username):
    vendedor = persona.objects.get(usuario=username)
    return render(request,'crearFacturaSINorden.html', {"vendedor": vendedor})


def ventasinOrdenHtml(request,username):

    vendedor = persona.objects.get(usuario=username)
    return render(request,'ventasinOrden.html', {"vendedor": vendedor})


def RegistrarHistoriaClinica(request,username):
    veterinario = persona.objects.get(usuario=username)
    return render(request,'RegistrarHistoriaClinica.html', {"veterinario": veterinario})

def historiaClinica(request,username):

        id_mascota=request.GET["id_mascota"]
        fecha=request.GET["fecha"]
        hora=request.GET["hora"]
        medico=request.GET["medico"]
        motivo_consulta=request.GET["motivo_consulta"]
        sintomatologia=request.GET["sintomatologia"]
        diagnostico=request.GET["diagnostico"]
        procedimiento=request.GET["procedimiento"]
        medicamento=request.GET["medicamento"]
        dosis=request.GET["dosis"]
        id_orden=request.GET["id_orden"]
        historial_vacunacion=request.GET["historial_vacunacion"]
        alergias=request.GET["alergias"]
        detalle_procedimiento=request.GET["detalle_procedimiento"]
        
        
        ValidarRegistrar_historia_clinica(id_mascota, fecha,hora, medico, motivo_consulta, sintomatologia, diagnostico, procedimiento, medicamento, dosis, id_orden, historial_vacunacion, alergias, detalle_procedimiento)
        veterinario = persona.objects.get(usuario=username)
        return HttpResponse("todo melo")



