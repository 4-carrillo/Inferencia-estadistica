# INFERENCIA ESTADÍSTICA 
# INTRODUCCIÓN A R
# Profesor: Gonzalo Perez de la Cruz
# Ayudantes: Dioney Alonso Rosas Sanchez 
#            Juan Andrés Cervantes Sandoval

########################## DECLARAR VARIABLES ##########################
3
x<-3
x=3
(x<-3)

# Para saber las variables que tenemos guardadas:
ls()

#Borrar variables
rm(x)
x

# Para borrar todas las variables:
rm(list=ls())


########################## TIPOS DE DATOS ##########################

# DATOS ATÓMICOS: character, numeric (reales), integer, complex, logical (T/F)

# VECTORES
# Contienen elementos de una sola clase, se utiliza c() para concatenar datos:

x1 <- c(0.5, 0.6) #numeric
x2 <- c(TRUE, FALSE) #logical
x3 <- c(T, F) #logical
x4 <- c("a", "b", "c") #character
x5 <- 9:29 #integer
x6 <- c(10 + 0i, 2 + 4i) #complex
x7 <- NULL #vacio

# Para acceder a elementos de un vector se utiliza []:

x1[1] # Primer elemento del vector x1
x1[-1] # Todos los elementos del vector x1 sin el primero
x1[-c(1,2)] # Todos los elementos del vector x1 sin el primero ni el segundo

########################## COERCIÓN ##########################

# ¿Qué pasa si se mezclan distintos tipos de datos en un vector?

(y1 <- c(1.7, "a"))
(y2 <- c(TRUE, 2))
(y3 <- c("a", TRUE))

# Hay que tener mucho cuidado con esto, pues se guardan como un mismo tipo de dato.
# Para cambiar de un tipo de dato a otro usamos las funciones as."dato que se quiere"

x <- 0:6
class(x)
as.numeric(x)
as.logical(x)
as.character(x)


# LISTAS
# Pueden contener elementos de diferentes clases

x <- list(1, "a", TRUE, 1 + 4i)
x
sapply(x, class) ## Este comando aplica la función class a todos los elementos en x

# Para acceder a sus elementos se utiliza [[]]:
x[[1]]
View(x) # Para visulizar la lista completa


# MATRICES
# Son vectores de dos dimensiones
m <- matrix(nrow = 2, ncol = 3)
m
dim(m)

# Por default una matriz se acomodará por columnas:
m1 <- matrix(1:6, nrow = 2, ncol = 3)
m1
m2 <- matrix(1:6, nrow = 2, ncol = 3, byrow = T) # Para acomodar por renglón
m2

# A partir de un vector
m3 <- 1:10
m3
dim(m3) <- c(2, 5)
m3

# Combinar vectores con bind
m1 <- 1:3
m2 <- 4:6
m3 = cbind(m1, m2)
m4 = rbind(m1, m2)

# Para acceder a sus elementos se utiliza [Posición renglón, Posición columna]
m4[1,2]
m4[,2] # Si se omite la posición R entiende que son todos los elementos



# DATA FRAMES
# Tipo especial de lista. Es como la matriz de las listas
x <- data.frame(caso = 11:14, pertenencia = c(T, T, F, F))
x
nrow(x)
ncol(x)
# Para acceder a sus elementos, se hace igual que en las matrices
x[1,] # Todas las columnas y el primer renglón
x$caso # El signo $ sirve para obtener todos los valores de la variable



# NOMBRES
# Los objetos también pueden tener nombres.
# En general, esto nos permite ubicar de una mejor manera los elementos
# de nuestra variable

# En vectores:
x <- 1:3
names(x)
names(x) <- c("naranjas", "manzanas", "peras")
x
names(x)
x["peras"]

# En listas:
(y <- list(autos = 5, motos = 2, camiones = 3,  gas= F))
y$autos
y[["autos"]]


# En matrices:
(m <- matrix(1:6, nrow = 2, ncol = 3))
dimnames(m) <- list(c("a", "b"), c("c", "d", "e"))
m
m["a","e"]


########################## OPERACIONES ARITMÉTICAS USUALES ##########################
##   +  - * / ^  %/%  %%  ##

14+3 # suma
14-3 # resta
14*3 # multiplicación 
14/3 # division
14%/%3 #división entera (devuelve el resultado entero)
14%%3 #residuo de la división o módulo
14^3 # potencia

########################## FUNCIONES USUALES ##########################
# log exp sqrt abs sin cos tan asin acos atan
# factorial choose(n,x)  gamma  lgamma
# floor ceiling trunc round

sqrt(25) # raiz cuadrada
abs(-5) # valor absoluto
log(54)# logaritmo natural 
exp(3.988984) # funcion exponencial 
log2(54) #logaritmo base 2 
log(54,3) # logaritmo base n= 3
choose(6,2) #Combinaciones
factorial(4) # funcion factorial
floor(3.8) #función piso(menor entero más cercano)
ceiling(3.1) #función techo(mayor entero más cercano)
trunc(3.86575) #trunca los decimales
pi #numero pi
round(pi,0) #redondear a cero decimales
round(pi,4) #redondear a cuatro decimales
sin(pi) # función seno   #NOTA, LOS RESULTADOS SON EN RADIANES
cos(pi) # función coseno
tan(pi) #funcion tangente
asin(0) # arcoseno
acos(0)  #arcocoseno valor de pi/2
pi/2
atan(1) # valor de pi/4
pi/4
ceiling(tan(pi)) # si causa ruido el cero numérico
sinpi(.1)
paste(1,"es un numero impar")
paste(2,"es un numero par")

########################## OPERACIONES LÓGICAS ##########################
# T o TRUE, F o FALSE
# <  <=  >  >=  ==  != 
# ! & | xor
# is.finite  is.infinite  is.nan
# funciones indicadoras

4 < 4 #evalua operaciones logicas 4 es menor que 4?, regresa TRUE o FALSE
4 <= 4 #4 es menor igual a 4
4 == 3 #4 es igual a 3
4 != 3 #4 es distinto de 3
T #símbolo para verdadero
F #símbolo para falso
!T #el símbolo ! significa no, no verdadero = falso
!F # no falso = verdadero

is.finite(10) #las funciones is. regresan un valor de verdad, is.finite(10), es finito 10 = V
is.infinite(10) # es infinito 10 = no
is.nan(10) #no es un númeor 10 = F
#NaN significa "not a number"
is.finite(Inf)  #es finito infinito = f
is.infinite(Inf) #es infinito infinito = V

########################## FUNCIONES EVALUADAS EN VECTORES ##########################
# log exp sqrt abs sin cos tan asin acos atan
# gamma  lgamma floor ceiling trunc round

x= c(1,2,3)
y= c(4,5,6)
x+y # suma de vectores entrada a entrada
x-y # diferencia de vectores entrada a entrada
x*y # producto de vectores entrada a entrada
x/y # division de vectores entrada a entrada 

x = c(3.2,0,2.9)
x 
exp(x) #evalua y muestra la función exponencial a cada entrada del vector
log(x) #evalua y muestra la función logaritmo a cada entrada del vector
floor(x) #evalua y muestra la función piso a cada entrada del vector
ceiling(x) #evalua y muestra la función techo a cada entrada del vector


# Funciones vectoriales:

# min max range length sum prod diff
# cumsum cumprod cummax cummin pmax pmin
# sort rank order rev
# mean median var sd
x = c(5,-1,2,-4,-99,66) #reasignamos  valores a x
x
min(x) #devuelve el valor mínimo de los elementos del vector
max(x) #devuelve el valor máximo de los elementos del vector
range(x)  #devuelve el rango de los elementos del vector
length(x)   #devuelve el tamaños del vector
sum(x)   #devuelve la suma de los elementos del vector
prod(x)   #devuelve el producto de los elementos del vector
diff(x)   #devuelve los incrementos de los elementos del vector
cumsum(x) #  #devuelve la suma acumulada de los elementos del vector
cumprod(x)   #devuelve el producot acumulado de los elementos del vector
cummax(x)   #devuelve el máximo acumulado de los elementos del vector
cummin(x)   #devuelve el mínimo acumulado de los elementos del vector
y = c(-3,2,4,10,-5,30) #reasigna valores a y
x #muestra el vector x
y #muestra el vector y 
pmax(x,y) #devuelve el valor máximo entrada por entrada de x & y
pmin(x,y) #devuelve el valor mínimo entrada por entrada de x & y
prod(x,y) #suma todos los valores de los dos vectores
sum(x,y) #multiplica todos los valores de los dos vectores

sort(x) #ordena los valores del vector x
order(x) #indica que posición ocupan los valores de menor a mayor
rev(x) #ordena el vector x de mayor a menor
sort(x) #ordena el vector x de mayor a menor
median(x) #mediana de x
sum(x)/length(x) #promedio de x
mean(x) #media de x 
var(x) #varianza de x
sqrt(var(x)) #raiz de la varianza de x
sd(x) #desviación estandar de x

# Sucesiones y sequencias 
#  m:n  seq  rep 
2:11 #sucesión de 2 a 11
14:5 #sucesión de 14 a 5
seq(from = -1 , to = 2 , by = 0.2) #sucesión de -1 a 2 con incrementos de 0.2
seq(from = 2 , to = 3 , length = 11) #sucesión de 2 a 3 con 11 números
rep(3, 10 ) #repite el valor 3 10 veces
rep(c(1, 3, 5), times = 4) #repite el vector (1,3,5) 4 veces
rep(c(1, 3, 5), each = 4) #repite las entradas del vector (1,3,5) 4 veces
rep(10,Inf)
# Extrayendo subvectores:
# x[n] x[-n] x[m:n] x[-(m:n)] x[y]
x <- seq( from = 2 , to = 3 , length = 11) #sucesión de 2 a 3 con 11 números
x #muestra el vector x
x[2] #muestra la entrada 2 del vector x
x[-2] #muestra el vector x sin la entrada 2
x[3:5] #muestra las entradas de la 3 a la 5 del vector x
x[-(3:5)] #muestra el vector x sin las entradas de la 3 a 5
y = c(1,3,11) #reasigna valores a y
x[y] #muestra las entradas del vector x cuyos índices son los valores del vector y
x[-y] #muestra las entradas del vector x, cuyos índices no son los valores del vector y
x = c(5,-1,2,-4,-99,66) #reasigna valores a x
x[order(x)] #ordena los valores de x

########################## OPERACIONES CON MATRICES ##########################

(m = matrix(data = c(1,2,3,4,5,6),nrow = 2,ncol = 3))
rowSums(m) #Regresa un vector cuyas entradas son la suma de los renglones
colSums(m) #Regresa un vector cuyas entradas son la suma de las columnas
2*m # Cada entrada de la matriz multiplicada por 2
m/5 # Cada entrada dividida entre 5

(m1 = matrix(rep(1,6),2,3))
m*m1 #Multiplica entrada a entrada

(m2 = matrix(rep(1,6),3,2))
m%*%m2 #Multiplicación habitual de matrices

# Resolución de un sistema de ecuaciones Ax=b con la función solve
# 3x + 2y = 8
# x + y = 2
(A = matrix(c(3,1,2,1),nrow = 2,ncol = 2))
(b =  matrix(c(8,2),2,1))
solve(A,b)



#################BASE DE DATOS CSV o EXCEL##########################
#LEER BASES DESDE
#EXCEL
#install.packages("readxl")
library(readxl)
Titanic <- read_excel(" .xlsx")

#CSV
Titanic <- read.csv("titanic.csv") 
#Import Dataset usa library(read_r) 
#Titanic <-read_csv("titanic.csv")
#Si el documento esta en el mismo directorio no hay problema, si no, poner dirección
#Titanic <- read_csv("C:/Users/JuanAndres/Desktop/Inferencia Estadistica/titanic.csv")




#CREAR BASE desde Data Frame
pais=c("España","Egipto","Japon")
continente=c("Europa","Africa","Asia")
poblacion=c(46.7,98.9,126.5)
Base<-data.frame(pais,continente, poblacion)

#Excel
#install.packages("xlsx")
library(xlsx)
write.xlsx(Base, "Base.xlsx")
#, sheetName = "Paises", row.names = FALSE)

#CSV
write.csv(Base,"Base.csv")
#,row.names=F)






########################## PACKAGES ##########################

# Si queremos instalar una paquetería haremos uso de la funcion install.packages:
install.packages("knitr")
install.packages(c("ggplot2","dplyr"))

# Para hacer uso de una paquetería previamente instalada:
library(knitr)

# Ayuda inicial:
help.start()

# Para saber el funcionamiento de una función o paquetería:
help(matrix)
?matrix

# Si solo recuerdo parte del nombre de la función:
apropos("mean")



########################## DIRECTORIO DE TRABAJO ##########################

# Para obtener sobre que carpeta está trabajando R:
getwd()

# Para cambiarlo:
setwd("C:/Users/JuanAndres/Desktop/Inferencia Estadistica")


########################## ESTRUCTURAS DE CONTROL ##########################

##if, if else, for, while, do, do while

## hagamos una función que nos clasifica a los números del 1 al 5 como chicos
# y del 6 al 10 como grandes 


for (i in 1:10) {
  if (i > 5) {
    # Si se cumple que i > 5, entonces 'i' es 'grande'
    texto <- paste(i, "grande")
    # 'paste', como su nombre lo dice, sirve para 'pegar' cadenas de
    # caracteres (en este caso toma un número, 'i', y lo convierte en caracter
    # y luego lo pega al texto 'grande'). 
    print(texto)
  } else {
    # Si no se cumple i > 5, es decir que i <= 5, entonces 'i' es 'chico'
    texto <- paste(i, "chico")
    print(texto)
  }
}


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
# donde necesitamos información del Sexo, A=Altura, P=Peso y E=Edad de cada persona, nuestros argumentos.

TMB <- function(Sexo,Altura,Peso,Edad){
  if(Sexo=="mujer")
  { 655 + (9.6 * Peso) + (1.8 * Altura) - (4.7 * Edad)}
  else
  { 66 + (13.7 * Peso) + (5 * Altura) - (6.8 * Edad) }
}


TMB("hombre",170,57,32)


