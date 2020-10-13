# INFERENCIA ESTAD?STICA
# Introduccion a la graficacion en R
# Profesor: Gonzalo Perez de la Cruz
# Ayudante: Dioney Alonso Rosas Sanchez
# Ayudante: Alexis Adrian Carrillo Medina

# Esta clase esta enfocada a la graficacion de datos en R
# Apartir de bases de una base de datos real graficaremos 
# Y obtendremos informacion de las graficas


# R cuenta con 4 sistemas de graficacion:
# base graphics, grid graphics, lattice graphics, y ggplot2.
# Para este curso utilizaremos base graphics, no sin antes exhortarlos
# a indagar sobre ggplot2 que son los que mas se utilizan en la pr?ctica.


# Recuerden que antes de iniciar un nuevo script de R es recomendable
# borrar todos los objetos del ambiente para no causar errores.
# Para ello podemos ejecutar el siguiente codigo
rm(list = ls(all.names =  TRUE)) 
gc()

# libraries que se utilizaran:

library(readr) #para utilizar la funci?n read_csv
library(corrplot) #para el grafico de correlaciones
library(fdth) #para el calculo de distribuci?n de frecuencias
library(car) #para utilizar qqPlot

# Para poder cargar nuestra base de datos necesitamos cambiar el 
# directorio de trabajo a donde se encuentre nuesta base de datos
setwd("/home/a-carrillo/Documents/Escuela/Ayudantias/Inferencia estadistica/R/Ayudantia 1")

# Cargamos nuestra base de datos.
datos = read_csv("datos.csv") # guardamos en una variable "datos"

str(datos) # Para comprender la estructura de la base de datos

head(datos) # ver el encabezado de nuestra base de datos

View(datos) # Visualizamos los datos

### DESCRIPCION DE LA BASE DE DATOS

# Hay que entender como esta conformada la base de datos:

# municipios del pa?s Y conjuntos de variables
# sociodemogr?ficas relevantes.
#ENT: Clave de la entidad
#Entidad: nombre de la entidad
#MUN: nombre del municipio
#Municipio: porcentaje de viviendas particulares habitadas con piso de tierra.
#Alf: porcentaje de poblaci?n de 15 o m?s a?os que sabe leer y escribir.
#Asi: porcentaje de poblaci?n de 6 a 14 a?os que asiste a la escuela.
#EBC: porcentaje de poblaci?n de 15 o m?s a?os con educaci?n b?sica completa.
#Der: porcentaje de poblaci?n con derechohabiencia a servicios de salud.
#Pis: porcentaje de viviendas particulares habitadas con piso diferente de tierra.
#San: porcentaje de viviendas particulares habitadas que disponen de excusado o sanitario.
#Agu: porcentaje de viviendas particulares habitadas que no disponen de agua potable.
#Dre: porcentaje de viviendas particulares habitadas que no disponen de drenaje.
#Ele: porcentaje de viviendas particulares habitadas que no disponen de electricidad.
#Lav: porcentaje de viviendas particulares habitadas que disponen de lavadora.
#Ref: porcentaje de viviendas particulares habitadas que disponen de refrigerador.
#Ing: Estimaci?n de la media del ingreso corriente mensual en los hogares.

# Lo primero que se nos podria ocurrir es graficar los datos
# La funcion plot() es la funcion generica para realizar graficos en 
# primera instancia, R desplegara el grafico que considere mas adecuado
# para el tipo de variable que se esta tomando

plot(datos[,5:16])

# En este caso realiza un grafico de dispersion de todas las variables 2 a 2
# Esta grafica no nos dice mucho e incluso es dificil de leer

# Talvez es mas conveniente si encontramos relaciones entre las variables
# Esto lo haremos con la ayuda de la funcion corrplot
cor_datos = cor(datos[,5:16])
corrplot(cor_datos,method = "ellipse")

# La grafica es mas legible, no obstante aun no es algo digno
# de presentar

# Sera mas sencillo si nos enfocamos en una variable en particular.
# Seleccionemos la variable "lav", parece comportarse bien

# veamos un gr?fico de los datos de esta variable

plot(datos$Lav) 

# De nuevo, esto no nos dice nada...
# Para poder conocer mejor este variable necesitaremos presentar mas graficos

############# GR?FICOS PARA VARIABLES CONTINUAS ######################

# Histograma
# Para cada valor, categor?a o clase de la variable, se asocia una barra
# cuya altura es la frecuencia con la que se observa la categor?a

## histograma de frecuencias absolutas para la variable Lav

hist(datos$Lav, main="Histograma de la variable Lav",xlab = "Lav",
     ylab = "Frecuencia",col="deepskyblue3")

## histograma de frecuencias relativas para la variable Lav

hist(datos$Lav, main="Histograma de la variable Lav",xlab = "Lav",
     ylab = "Frecuencia",col="deepskyblue3",freq = F)

# podemos ver la densidad teorica de nuestra variable de inter?s con la funci?n
# lines(), la cual agrega lineas a la ?ltima gr?fica hecha.
# En este caso agregaremos la densidad y esto se hace con la funcion
# density()
lines(density(datos$Lav),lwd=2)


# o bien verla sin el histograma
plot(density(datos$Lav))

# Tambien podemos calcular la funcion de distribucion empirica
# Esto de manera tradicional
plot(cumsum(density(datos$Lav)$x))

#Para hacer que se vea como una linea agregamos el parametros type = "l"
plot(cumsum(density(datos$Lav)$x),type="l")

#Para la distribucion de frecuencias usamos la liberia fdth

dist <- fdt(datos$Lav,breaks="Sturges")
dist #nos brinda una tabla con los calculos de la distribuci?n de frecuencias.


#Donde
#f= frecuencia absoluta
#rf= frecuencia relativa
#rf(%) frecuencia relativa porcentual
#cf= frecuencia acumulada
#cf(%)=frecuencia acumulada porcentual

plot(dist, type="cfh")   #histograma de frecuencias acumulada
plot(dist, type="cfp")   #poligono de frecuencias acumulado

# Boxplot
# Tambi?n conocido como diagrama de caja y bigote.
# Es un m?todo estandarizado para representar gr?ficamente una serie de datos
# num?ricos a trav?s de sus cuartiles. A su vez nos sirve a encontrar datos at?picos
boxplot(datos$Lav) 

# podemos verificar la construcci?n del
# boxplot, viendo un resumen de nuestra 
# variable 
summary(datos$Lav)

# podemos hacer los boxplots para todas las variables

boxplot(datos[,c(5:15)])

## veamos un gr?fico qqplot

qqplot(datos$Lav, datos$Ref)# se compara si el comportamiento
# de las variables es parecido

abline(0,1) # sirve para trazar la identidad

# uno de los principales usos del qqplot es ver 
# si la distribuci?n de nuestra variable, o bien nuetra base de datos
# es normal, graficando los cuantiles teoricos de una dist
# normal, contra los cuantiles de la dist teorica de nuestra
# variable

qqnorm(datos$Lav)
qqline(datos$Lav)
# claramente observamos que esto no sigue una dist normal 

# Otra manera m?s pr?ctica es con la funcion qqPlot() de la library car

qqPlot(datos$Lav)

#Hagamos la prueba 
qqPlot(rnorm(100,0,1))

### GR?FICOS PARA VARIABLES CATEG?RICAS

# Cargamos nuestra base de datos.
datos2 = read_csv("datos2.csv") # guardamos en una variable "datos2"

str(datos2) # Para comprender la estructura de la base de datos

head(datos2) # ver el encabezado de nuestra base de datos

View(datos2) # Visualizamos los datos

# Nos centraremos unicamente en el sexo y el estado civil
# Para el sexo tenemos:
# 1 = Masculino, 2 = Femenino
# Para el estado civil:
# 1 =  Soltero, 2 = Casado/Pareja, 3 = Separado, 4 = Viudo


# Contaremos el numero de hombres y mujeres y los uniremos
# En un vector
nSexo <- c(sum(datos2$sexo==1),sum(datos2$sexo==2))

# Categorizaremos los sexos
Sexo <- c("Masculino", "Femenino")

# Calcularemos el porcentaje
porcentaje <- round(nSexo/sum(nSexo)*100)

# Lo hacemos bonito
Sexo <- paste(Sexo, porcentaje)
Sexo <- paste(Sexo, " %")

# Grafica de pastel
pie(nSexo,labels = Sexo)

# Grafica de barras
#Para ello necesitamos convertir a factor
sex <- factor(datos2$sexo)
sex
plot(sex)

# La funci?n par se utiliza para configuraciones de gr?ficas en general
# Con mfrow se configura el n?mero de gr?ficas desplegadas
# a la vez
par(mfrow=(c(1,2))) 

# Gr?ficos de dispersi?n (standard y sunflower)

# Grafico de puntos
plot(estcivil ~ sexo, data=datos2)

# Add the title
title("Grafica de puntos")

# Create the sunflowerplot
sunflowerplot(estcivil ~ sexo, data=datos2)

# Add the title
title("Grafica Sunflower")

# Regresemos las graficas a la normalidad
par(mfrow=(c(1,1)))

# Mosaicplot
# Cuando quieres observar la proporci?n de variables categ?rica vs categ?rica
mosaicplot(sexo~estcivil,data=datos2)



