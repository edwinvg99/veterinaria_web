"""from veterinaria.models import persona
"""

"""
def crearPersona(cedula,nombre,rol,usuario,contraseña):
    try:
        Persona=persona.objects.get(id=cedula)
    except:
        Persona=None
    if Persona!= None:
        raise Exception("persona ya registrada")
    Persona=persona()
    Persona.id=cedula
    Persona.nombre=nombre
    Persona.rol=rol
    Persona.usuario=usuario
    Persona.contraseña=contraseña
    Persona.save()
    return

def login():
    try:
        Username=persona.objet.get(usuario=user,contraseña=pasd)"""