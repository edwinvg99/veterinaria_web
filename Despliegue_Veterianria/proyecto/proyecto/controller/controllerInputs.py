"""from veterinaria.controller.controllerBussines import crearPersona
from veterinaria.models import persona"""
"""
def validarCrearPersona(cedula,nombre,rol,usuario,contraseña):
    
    if len(cedula) == 0 or len(nombre) == 0  or len(usuario) == 0  or len(contraseña) == 0 :
        print("Error: Ningún campo puede estar vacío.")
        return
    
    if not cedula.isdigit() or len(cedula) > 10 or int(cedula)<0:
        print("Error: La cédula debe ser numérica, tener un máximo de 10 caracteres y no puede ser negativa.")
        return
    
    if not nombre.isalpha():
        print("Error: El nombre solo puede contener letras.")
        return
    
    return crearPersona(cedula,nombre,rol,usuario,contraseña)
    
    
    

"""
    