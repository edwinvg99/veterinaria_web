from veterinaria.models import persona,mascota,facturaSINorden
from django.http import request,HttpResponse
from veterinaria.conexionMongoDB import collection


def crearPersona(cedula,nombre,rol,usuario,contraseña):
    try:
        Persona=persona.objects.get(cedula=cedula)
    except:
        Persona=None
    if Persona!= None:
        raise Exception("persona ya registrada :)")
    
    Persona=persona()
    rol=rol.upper()
    if(rol!="Veterinario" and rol!="VENDEDOR" and rol!="VETERINARIO" and rol!="VENDEDORA" and rol!="VETERINARIA" and rol!="Vendedora" and rol!="veterinaria" and rol!="vendedora"):
        persona.usuario=None
        persona.contraseña=None
    else:
        Persona.usuario=usuario
        Persona.contraseña=contraseña

    Persona.cedula=cedula
    Persona.nombre=nombre
    Persona.rol=rol
    
    
    Persona.save()
    return



def registrar_mascota(id, nombre, cedula_dueno, edad, especie, raza, caracteristicas, peso):
    try:
        Mascota = mascota.objects.get(id=id)
    except mascota.DoesNotExist:
        Mascota = None

    if Mascota is not None:
        raise ValueError("La mascota ya existe.")


    try:
        dueno = persona.objects.get(cedula=cedula_dueno)
        
    except persona.DoesNotExist:
        raise ValueError("El dueño no está registrado.")

    Mascota = mascota()
    Mascota.nombre = nombre
    Mascota.especie = especie
    Mascota.raza = raza
    Mascota.caracteristicas = caracteristicas
    Mascota.peso = peso
    Mascota.cedula_dueno = dueno
    Mascota.edad = edad

    Mascota.save()
    return HttpResponse("Mascota registrada exitosamente.")

def registrarFacturaSINorden(idFactura,idCliente,nombreProducto,valor,cantidad): 
    try:
        Factura = facturaSINorden.objects.get(idFactura=idFactura)
    except facturaSINorden.DoesNotExist:
        Factura = None

    if Factura is not None:
        raise ValueError("Codigo de factura ya registrado")

    Factura = facturaSINorden()

    Factura.idFactura = idFactura
    Factura.idCliente = idCliente
    Factura.nombreProducto = nombreProducto
    Factura.valor = valor
    Factura.cantidad = cantidad

    Factura.save()
    
    Factura.total = float(valor) * int(cantidad)

    return Factura
    
def GenerarLogin(username, password):
    try:
        usuario = persona.objects.get(usuario=username, contraseña=password)
        return usuario.rol
    except persona.DoesNotExist:
        return False
    




def registrar_historia_clinica(id_mascota, fecha,hora, medico, motivo_consulta, sintomatologia, diagnostico, procedimiento, medicamento, dosis, id_orden, historial_vacunacion, alergias, detalle_procedimiento):
# Buscar la mascota por id
    try:
        Mascota = mascota.objects.get(id=id_mascota)
    except mascota.DoesNotExist:
        Mascota = None

    if Mascota is  None:
        raise ValueError("La mascota no existe.")


    # Crear el objeto HistoriaClinica
    registro_historia_clinica = {str(fecha)+str(hora): {}}
    historiaActual= {
        "fecha": fecha,
        "hora": hora,
        "medico": medico,
        "motivo_consulta": motivo_consulta,
        "sintomatologia": sintomatologia,
        "diagnostico": diagnostico,
        "procedimiento": procedimiento,
        "medicamento": medicamento,
        "dosis": dosis,
        "id_orden": id_orden,
        "historial_vacunacion": historial_vacunacion,
        "alergias": alergias,
        "detalle_procedimiento": detalle_procedimiento
    }
    
    historia=collection.find_one({"_id":Mascota.id})
    print(registro_historia_clinica)
    registro_historia_clinica[str(fecha)+str(hora)]=historiaActual
    
    if historia:
        historia["historias"][str(fecha)+str(hora)]=historiaActual
        collection.update_one({"_id":Mascota.id},{"$set": historia})
    else:
        historiaClinica = {"_id":Mascota.id,"historias":registro_historia_clinica}
        collection.insert_one(historiaClinica)
    
    
    
    