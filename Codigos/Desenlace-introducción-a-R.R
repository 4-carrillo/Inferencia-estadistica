# INFERENCIA ESTADÍSTICA 
# INTRODUCCIÓN A R (DESENLACE)
# Profesor: Gonzalo Perez de la Cruz
# Ayudantes: Dioney Alonso Rosas Sanchez 
#            Juan Andrés Cervantes Sandoval
#            Alexis Adrian Carrillo Medina
##########################################

##Para empezar## 
#0. Si su documento tiene signos que no lee de inmediato, abrir con  
# File -> Reopen with Encoding -> WINDOWS-1252 -> ok

#1. Dejar el ambiente en blanco, recomendable pero con cuidado de 
# no borrar algo con lo que van a trabjar.
rm(list = ls(all.names =  TRUE)) 
gc()

#2. Ver y fijar la dirección donde están sus documentos para facilitar llamarlos 
getwd()
#setwd("C:/Users/ ")

#3. Llamar (y en caso necesario instalar) las librerías que usarán
#install.packages("readr")
#install.packages("dplyr")
library(readr) 
library(dplyr)




########################## ESTRUCTURAS DE CONTROL ##########################

##if, if else, for, while, 

#Hagamos una función que nos clasifica a los números del 1 al 5 como chicos
# y del 6 al 10 como grandes 

#For, if
for (i in 1:10) {
  if (i > 5) {
    texto <- paste(i, "grande")
    print(texto)
  } else {
    texto <- paste(i, "chico")
    print(texto)
  }
}
# Si se cumple que i > 5, entonces 'i' es 'grande'
# 'paste', como su nombre lo dice, sirve para 'pegar' cadenas de
# caracteres (en este caso toma un número, 'i', y lo convierte en caracter
# y luego lo pega al texto 'grande').
# Si no se cumple i > 5, es decir que i <= 5, entonces 'i' es 'chico'


#While
i <- 1
while (i < 6) {
  print(i)
  i = i+1
}
#Mientras i sea menor que 6 entonces imprime el valor de i, luego suma 1 a i (contador)


################################ FUNCIONES ################################

# En una función tenemos 3 tipos de elementos:
#  Argumentos (o valores de entrada).
#  Cuerpo: operaciones que han de realizarse. Se deben localizar entre corchetes «{}”.
#  Resultado (o valores de salida): la última expresión que se ejecuta.

# mifuncion <- function(argumento1, argumento2, ...) {
# cuerpo
# resultado
# }

# Ejemplo. Cálculo de la tasa de metabolismo basal
# La Tasa de Metabolismo Basal (TMB), es la cantidad mínima de energía que necesita
# tu cuerpo para funcionar. Nunca debemos ingerir menos cantidad de calorías de las 
# que marca la tasa metabólica. La TMB se calcula siguiendo las siguientes ecuaciones:
# TMB Mujer = 655 + (9,6 * P) + (1,8 * A) – (4,7 * E)
# TMB Hombre = 66 + (13,7 * P) + (5 * A) – (6,8 * E)
# donde necesitamos información del 
#Sexo, A=Altura, P=Peso y E=Edad de cada persona, nuestros argumentos.

TMB <- function(Sexo,Altura,Peso,Edad){
  if(Sexo=="mujer")
  { 655 + (9.6 * Peso) + (1.8 * Altura) - (4.7 * Edad)}
  else
  { 66 + (13.7 * Peso) + (5 * Altura) - (6.8 * Edad) }
}


TMB("hombre",170,57,32)


#########################ORDEN DE DATA FRAME####################
titanic<- read_csv("titanic.csv")

View(titanic)
names(titanic)

####Filtrar un DATAFRAME #Necesita libreria dplyr
#Por filas
sobre <- filter(titanic, Survived==1)
View(sobre)
#Se puede guardar en un nuevo data frame o escribir sobre el mismo 
#(se recomienda uno nuevo)

#Si queremos que nos haga un data frame con sólo los sobrevivientes, mujeres
# y que su tarifa halla sido menor a 15, puedes poner solo el nombre de la variable
#o tambien de donde pertenece con $
sobre_muj <- filter(titanic, Survived==1 & titanic$Sex=="female" & Fare<15)
View(sobre_muj)

#Por columnas
titanic_corto <- select(titanic,Name,Age,Fare,Survived)
View(titanic_corto)

######Ordenar Dataframe por valores de una columna "order"
Edad_ord <- titanic[order(titanic$Age),]
View(Edad_ord)

#####Cambiar tipo de variable en DATA FRAME
class(titanic$Survived)
titanic$Survived <- as.logical(titanic$Survived) 
class(titanic$Survived)
View(titanic)


