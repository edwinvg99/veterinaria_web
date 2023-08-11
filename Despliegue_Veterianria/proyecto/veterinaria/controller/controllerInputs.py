from veterinaria.controller.controllerBussines import crearPersona,registrar_mascota,registrar_mascota,registrarFacturaSINorden,registrar_historia_clinica
from django.http import request,HttpResponse
from django.db import transaction

from veterinaria.models import persona,mascota,facturaSINorden

from django.contrib import messages



def validarCrearPersona(cedula,nombre,rol,usuario,contraseña):
    
    if not all([cedula, nombre, rol, usuario, contraseña]):
        raise ValueError("ERROR: Ningún campo puede estar vacío.")
    
    if not cedula.isdigit() or len(cedula) > 10 or int(cedula)<0:
        raise ValueError("ERROR: La cédula debe ser numérica, tener un máximo de 10 caracteres y no puede ser negativa.")

    if not nombre.isalpha():
        
        raise ValueError("ERROR: El nombre solo puede contener letras.")

    if rol not in ["VETERINARIO", "VENDEDOR", "VETERINARIA", "VENDEDORA"]:
            usuario = None
            contraseña = None
    
    return crearPersona(cedula,nombre,rol,usuario,contraseña)


def validarMascota(id, nombre, cedula_dueno, edad, especie, raza, caracteristicas, peso):
    # Validar que todos los campos estén llenos
    if not all([id, nombre, cedula_dueno, edad, especie, raza, caracteristicas, peso]):
        raise ValueError("Error: Todos los campos son obligatorios.")

    # Validar que el ID de la mascota sea un número
    if not str(id).isdigit():
        raise ValueError("Error: El ID de la mascota debe ser un número.")

    # Validar que el nombre y la especie sean solo texto
    if not str(nombre).isalpha():
        raise ValueError("Error: El nombre de la mascota debe ser solo texto.")
    if not str(especie).isalpha():
        raise ValueError("Error: La especie de la mascota debe ser solo texto.")

    # Validar que la cédula del dueño sea un número
    if not str(cedula_dueno).isdigit():
        raise ValueError("Error: La cédula del dueño debe ser un número.")

    # Validar que la edad sea un número no negativo
    if not str(edad).isdigit() or int(edad) < 0:
        raise ValueError("Error: La edad debe ser un número no negativo.")

    # Validar que el peso sea un número no negativo
    if not str(peso).isdigit() or int(peso) < 0:
        raise ValueError("Error: El peso debe ser un número no negativo.")

    # Validar que las características y la raza sean solo texto
    
    if not str(caracteristicas.replace(" ", "")).isalpha():
        raise ValueError("Error: Las características deben ser solo texto.")
    
    if not str(raza).isalpha():
        raise ValueError("Error: La raza debe ser solo texto.")

    # Si todo está bien, retornar los datos validados en forma de tupla
    registrar_mascota(id, nombre, cedula_dueno, edad, especie, raza, caracteristicas, peso)

def validarCrearFacturaSINorden(idFactura,idCliente,nombreProducto,valor,cantidad):
    if not all([idFactura, idCliente, nombreProducto, valor, cantidad]):
        raise ValueError("Error: Todos los campos son obligatorios.")
    
    return registrarFacturaSINorden(idFactura,idCliente,nombreProducto,valor,cantidad)


def validarlogin(username, password):
    try:
        persona_obj = persona.objects.get(usuario=username, contraseña=password)
        
        if persona_obj.rol == "VETERINARIO" or persona_obj.rol == "VETERINARIA":
            tipo_usuario = "VETERINARIO"
            
        if persona_obj.rol == "VENDEDOR" or persona_obj.rol == "VENDEDORA":
            tipo_usuario = "VENDEDOR"
        else:
            tipo_usuario = "persona"
        return tipo_usuario
    except persona.DoesNotExist:
        return "invalido"



def ValidarRegistrar_historia_clinica(id_mascota, fecha,hora, medico, motivo_consulta, sintomatologia, diagnostico, procedimiento, medicamento, dosis, id_orden, historial_vacunacion, alergias, detalle_procedimiento):
    """
    if not id_mascota or not fecha or not medico or not motivo_consulta or not sintomatologia or not diagnostico or not procedimiento or not medicamento or not dosis or not id_orden or not historial_vacunacion or not alergias or not detalle_procedimiento:
        raise ValueError("Error: Ningún campo puede estar vacío.")
    
    if not id_mascota.isdigit():
        raise ValueError("Error: El ID de la mascota debe ser un número.")
    if not medico.isalpha():
        raise ValueError("Error: El nombre del médico debe ser solo texto.")
    if not motivo_consulta.isalpha():
        raise ValueError("Error: El motivo de la consulta debe ser solo texto.")
    if not sintomatologia.isalpha():
        raise ValueError("Error: La sintomatología debe ser solo texto.")
    if not diagnostico.isalpha():
        raise ValueError("Error: El diagnóstico debe ser solo texto.")
    if not procedimiento.isalpha():
        raise ValueError("Error: El procedimiento debe ser solo texto.")
    if not medicamento.isalpha():
        raise ValueError("Error: El medicamento debe ser solo texto.")
    if not dosis.isdigit():
        raise ValueError("Error: La dosis debe ser un número.")
    if not id_orden.isdigit():
        raise ValueError("Error: El ID de la orden debe ser un número.")
    if not historial_vacunacion.isalpha():
        raise ValueError("Error: El historial de vacunación debe ser solo texto.")
    if not alergias.isalpha():
        raise ValueError("Error: Las alergias deben ser solo texto.")"""
    
    #si todo esta correcto
    registrar_historia_clinica(id_mascota, fecha,hora, medico, motivo_consulta, sintomatologia, diagnostico, procedimiento, medicamento, dosis, id_orden, historial_vacunacion, alergias, detalle_procedimiento)

