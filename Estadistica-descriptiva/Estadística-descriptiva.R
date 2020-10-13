# INFERENCIA ESTADÍSTICA
# ESTADÍSTICA DESCRIPTIVA
# Profesor: Gonzalo Perez de la Cruz
# Ayudantes: Dioney Alonso Rosas Sanchez
#            Juan Andrés Cervantes Sandoval

# Esta clase estará enfocada al análisis exploratorio
# y descriptivo de una base de datos real, con la finalidad
# que el estudiante pueda ENTENDER mejor los conceptos y
# técnicas estadísticas que se han definido hasta el momento.

# libraries que se utilizarán:
#install.packages("modeest")

library(readr) #para utilizar la función read_csv
library(modeest) #para calcular la moda


######################EJEMPLO SENCILLO CON VARIABLES CONTINUAS EN VECTOR#########
#DATOS DE MENDENHALL, ejercicio 1.25
#Los siguientes datos dan los tiempos en segundos de falla para n = 88 
#transmisores-receptores de radio:

tfalla<-c(16, 224, 16, 80, 96, 536, 400, 80,
         392, 576, 128, 56, 656, 224, 40, 32,
         358, 384, 256, 246, 328, 464, 448, 716,
         304, 16, 72, 8, 80, 72, 56, 608,
         108, 194, 136, 224, 80, 16, 424, 264,
         156, 216, 168, 184, 552, 72, 184, 240,
         438, 120, 308, 32, 272, 152, 328, 480,
         60, 208, 340, 104, 72, 168, 40, 152,
         360, 232, 40, 112, 112, 288, 168, 352,
         56, 72, 64, 40, 184, 264, 96, 224,
         168, 168, 114, 280, 152, 208, 160, 176)


mean(tfalla) # calculo de la media
median(tfalla) # calculo de la mediana 
mfv(tfalla) # calculo de la moda 
var(tfalla) # varianza
sd(tfalla) # desviación estandar 

min(tfalla) # primer estadístico de orden
max(tfalla) #máximo estadístico de orden
(rango= max(tfalla)-min(tfalla)) #rango de valores 


###################EJEMPLO CON MULTIPLES VARIABLES EN DATA FRAME################

# Cargamos nuestra base de datos, para esto debemos revisar que R
# esté tomando como directorio la carpeta donde está guardada nuestra base.

datos = read_csv("titanic.csv") # guardamos en una variable "datos"


str(datos) # Para comprender la estructura de la base de datos
View(datos) # Visualizamos los datos


## MEDIDAS DE TENDENCIA CENTRAL
# Cantidades que buscan representar un valor central del conjunto de datos.
# Entre ellas se encuentran la media, mediana y moda.

mean(datos$Fare) # calculo de la media
median(datos$Fare) # calculo de la mediana 

## para la moda es necesario llamar al paquete "modeest"

mfv(datos$Fare) # sin embargo al trabajar con variables 
               #continuas ésta medida no nos aporta mucha información

## MEDIDAS DE DISPERSIÓN
# Cantidades que buscan medir de alguna forma el grado de dispersión
# o separación entre los datos. Entre ellas se encuentran la varianza, 
# desviación estándar, estadísticos de orden y rango.

var(datos$Fare) # varianza
sd(datos$Fare) # desviación estandar 


min(datos$Fare) # primer estadístico de orden
max(datos$Fare) # n-esimo estadístico de orden 

(rango =  max(datos$Fare) - min(datos$Fare)) # rango 

# MEDIDAS DE FORMA
# Cantidades que buscan describir la "forma" en que se distribuyen los datos.

# Coeficiente de asimetría/sesgo
# Negativo: Sesgo a la izquierda, lo cual quiere decir que la cola de la 
# distribución está cargada a la izquierda
# Positivo: Sesgo a la derecha.

skewness=function(x) {
  m3=mean((x-mean(x))^3)
  skew=m3/(sd(x)^3)
  skew}

skewness(datos$Fare) # asimetría positivo (sesgo a la derecha)
# es decir, hay una cola más alargada a la derecha

# Coeficiente de curtosis k
# Leptocúrtica (k>0): Decaimiento rápido, colas ligeras (Picuda).
# Mesocúrtica (k=0): Curva normal.
# Platicúrtica (k<0): Decaimiento lento, colas amplias (Aplanada).

curtosis=function(x) {
  m4=mean((x-mean(x))^4) 
  curt=m4/(sd(x)^4)-3  
  curt}

  
curtosis(datos$Fare) # positiva entonces es leptocurtica 
              

# CUANTILES
# Consideremos los datos ordenados de menor a mayor conservando las repeticiones.
sort(datos$Fare)

# Un cuantil es un número que separa a los datos en dos partes: un cierto
# porcentaje de los datos son menores o iguales al cuantil y el porcentaje
# complementario corresponde a datos que son mayores o iguales al cuantil.
# en R se utliza la función quantile().

# Ejemplo:
# La mediana es el cuantil cuya proporción de datos a la izquierda de él
# es el 50% al igual que a la derecha
median(datos$Fare)
quantile(datos$Fare,.5)

# Observación: el cuantil no es necesariamente único y pueden existir diversas
# formas de calcularlo, para más info utilizar help(quantile).

# Hay cuantiles que reciben nombres más específicos: percentiles, deciles,
# cuartiles.


#calulemos los percentiles
quantile(datos$Fare,probs=seq(0,1,.01))

#calculemos los deciles 

quantile(datos$Fare,probs=seq(0,1,.1))

#calculemos los cuartiles

quantile(datos$Fare,probs=seq(0,1,.25))


# En R existe una función muy importante llamada summary(), la cual
# nos arroja:

summary(datos$Fare)

# Notemos que con este comando, podemos hacer un resumen
# tanto de cuartiles, como de tendencia central y medidas 
# de dispersión



#DATOS CATEGÓRICOS
#Podemos ver la frecuencia absoluta de cada categoría de alguna variable discreta
#de nuestro Data Frame (o vector) usando la función table
table(datos$Sex)
table(datos$Pclass)
table(datos$Survived)

#Esta función usa libreria (gmodels), es muy útil para ver la frecuncia 
#absoluta, relativa y ver cruces con otras variables

CrossTable(datos$Sex) #frecuencia absoluta y relativa
CrossTable(datos$Sex,datos$Survived, prop.t=F,prop.chisq=F) 
#Cruce de frecuencias de sexo y sobrevivencia
#Hace pruebas de independencia entre variables, eso no lo veremos por ahora



#Datos continuos a categóricos
#De esta forma podemos crear otra variable dentro del data frame
#cut categoriza (divide) los datos continuos en grupos, haciendo una variable discreta
#seq nos dice en cuantos grupos se divide, rigth=FALSE es para que tome el primer valor

datos$Fare_cat<- cut(datos$Fare, seq(0,550,50),right=FALSE)
table(datos$Fare_cat)

