from django.db import models

# Create your models here.
class persona(models.Model):
    cedula= models.IntegerField(primary_key=True)
    nombre=models.CharField(max_length=100,null=False)
    rol=models.CharField(max_length=100,null=False)
    usuario=models.CharField(max_length=100,null=True)
    contraseña=models.CharField(max_length=100,null=True)
    
    def __str__(self):
        return self.nombre +"-"+ self.rol


class mascota(models.Model):
    id= models.AutoField(primary_key=True)
    nombre=models.CharField(max_length=50,null=False)
    especie=models.CharField(max_length=50,null=False)
    raza=models.CharField(max_length=50,null=False)
    caracteristicas=models.CharField(max_length=500,null=False)
    peso=models.FloatField(null=False)
    cedula_dueno= models.ForeignKey(persona, null=False, blank=False, on_delete=models.CASCADE)
    edad=models.IntegerField(null=False,default=0)

    
    def __str__(self):
        return self.nombre


class facturaSINorden(models.Model):
    idFactura= models.IntegerField(primary_key=True)
    idCliente=models.IntegerField(null=False)
    nombreProducto=models.CharField(max_length=50,null=False)
    valor=models.FloatField(null=False)
    cantidad= models.IntegerField(null=False)
    
    def __str__(self):
        return self.nombreProducto



