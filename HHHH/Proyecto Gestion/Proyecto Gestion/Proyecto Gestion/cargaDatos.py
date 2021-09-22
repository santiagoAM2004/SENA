#!/usr/bin/python
# -*- coding:utf-8 -*-

'''
Este programa abre un archivo de Excel con X columnas, concatena 3 de ellas y las exporta a un archivo de Excel en la misma carpeta donde se aloja este archivo Python


Material de consulta:
https://aprendeconalf.es/docencia/python/manual/pandas/

https://datascienceparichay.com/article/pandas-save-dataframe-to-an-excel-file/

https://dapre.presidencia.gov.co/normativa/normativa/DECRETO%20466%20DEL%208%20DE%20MAYO%20DE%202021.pdf

'''

#Para leer archivos de una carpeta
from os import listdir
import os
from os.path import isfile, join
#Para usar y manipular datos rapidamente: pandas
import pandas as pd
#para manipular tiempo
import time

#----------------------------------------------------------------------------------------------
#variable global donde se indica en que carpeta se almacenan los archivos
carpeta="bodega"

#----------------------------------------------------------------------------------------------
#Funcion para saber cuantos archivos de asistencia hay
def ls(ruta = '.'):
    lista=[]
    archivos= [arch for arch in listdir(ruta) if isfile(join(ruta, arch))]
    for a in archivos:
        if(".xls" in a):
            lista.append(a.lower())
    return lista

#----------------------------------------------------------------------------------------------
#Crea y guarda en un archivo de excel la lista entregada por parametros
def guardaExcel(lista):
    #anexo un titulo a la columna
    df = pd.DataFrame({'Nombres completos': lista})
    df.to_excel('Mi_archivo_excel.xlsx', sheet_name = 'Mi_hojaHHHH',startcol = 2,index=False)

#----------------------------------------------------------------------------------------------
#Abre el archivo seleccionado y extrae los nombres, aprellido1 y apellido2 y los une en una sola cadena
#Ademas los ordena
def exportaNombres(archivo):
    inicio = time.time()
    archivo=carpeta+"\\"+archivo
    nombres=[]
    #Abro el archivo con los datos completos
    df = pd.read_excel(archivo)
    temporal=df.loc[:,('Nombre')]+str(" ")+(df.loc[:,('Apellido1')])+str(" ")+(df.loc[:,('Apellido2')])
    temporal=temporal.sort_values()
    #print(temporal)
    guardaExcel(temporal)
    print("="*60)
    fin = time.time()
    tardo=(fin-inicio)
    print("Termine, termine, acabe con el palo de café!... \ny me demoré:",tardo,"segundos exportando ese jurgo de datos (",len(temporal),"para ser exactos)")
    time.sleep(10)
    menuP()

#----------------------------------------------------------------------------------------------
#menu inicial para el usuario
def menuP():
    opcion=100
    while opcion!=1:
        if opcion==0:
            os.system("cls")
            break
            
        mensaje="Bienvenido al menú principal"
        os.system("cls")
        print("╔"+"═"*80+"╗")
        a=int(((80/2)-(len(mensaje)/2)))
        print("║"+" "*a+mensaje+" "*a+"║")
        print("╚"+"═"*80+"╝")
        print("")
        print("\t\tOPCIONES:")
        print("\t1. Buscar archivo.")
        print("\t0. Salir.")
        print("")
        opcion=validaOpciones("\t\t\tIngrese opción",2)
    if(opcion==1):
        menuC()

#----------------------------------------------------------------------------------------------
#menu para seleccionar el archivoa trabajar, la arpeta por defecto es bodega
def menuC():
        mensaje="Lista de archivos existentes en la carpeta "+carpeta
        os.system("cls")
        print("┌"+"─"*80+"┐")
        a=int(((80/2)-(len(mensaje)/2)))
        print("|"+" "*a+mensaje+" "*a+" |")
        print("└"+"─"*80+"┘")
        print("")
        listadeArchivos=ls(carpeta)
        b=1
        for a in listadeArchivos:
            print("\t"+"("+str(b)+"):"+a)
            b+=1
        print("")
        print("\t\tOPCIONES:")
        print("\t1 al "+str(b-1)+" . para abrir el archivo.")
        print("\t0. Cancelar.")
        print("")
        opcion=validaOpciones("\t\t\tIngrese opción: ",b)
        if opcion==0:
            menuP()
        elif opcion <b:
            menuA(listadeArchivos[opcion-1])

#----------------------------------------------------------------------------------------------
#Opciones a realizar con el archivo seleccionado
def menuA(archivo):
        mensaje="Acciones a realizar con el archivo: "+archivo
        os.system("cls")
        print("┌"+"─"*80+"┐")
        a=int(((80/2)-(len(mensaje)/2)))
        print("|"+" "*a+mensaje+" "*a+" |")
        print("└"+"─"*80+"┘")
        print("")
        print("\t\tOPCIONES:")
        print("\t1: Exportar nombres.")
        print("\t2: Calcular edades.")
        print("\t0. Cancelar.")
        print("")
        opcion=validaOpciones("\t\t\tIngrese opción: ",2)
        if opcion==0:
            menuC()
        elif opcion==1:
            exportaNombres(archivo)
        elif opcion==2:
            print("TODO-Coming soon")

#----------------------------------------------------------------------------------------------
def validaOpciones(mensaje,limite):
    valida=False
    while valida==False:
        cadenaTeclado=input(mensaje+": ")
        try: 
            a=int(cadenaTeclado)
            if(a>=0 and a <= int(limite)):
                valida= True
        except ValueError:
            valida= False
    return a

#----------------------------------------------------------------------------------------------
def inicio():
    menuP()

#----------------------------------------------------------------------------------------------
if __name__ == "__main__":
    inicio()
