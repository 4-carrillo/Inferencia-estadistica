# INFERENCIA ESTADISTICA
# INTERVALOS DE CONFIANZA
# Profesor: Gonzalo Perez de la Cruz

# En esta clase aterrizaremos los conceptos teoricos de 
# intervalos de confianza apartir de simulaciones.

# Simularemos 1000 muestras de n variables aletorias Uniforme(0,theta)
# con n=20,100,500; apartir de elles observaremos el comportamiento
# del intervalo de confianza calculado para esta variable

# Limpiamos la variables
rm(list = ls(all.names =  TRUE)) 
gc()

# Definimos theta
theta<-1

# Definimos la cantidad de variables aleatorias
n<-c(20,100,500)

# Generamos las muestras
set.seed(2)
U1<-replicate(1000,runif(n[1],0,theta))
U2<-replicate(1000,runif(n[2],0,theta))
U3<-replicate(1000,runif(n[3],0,theta))

# Definimos nuestra alpha
alpha=0.05

# Definimos nuestro intervalo de confianza al (1-alpha)100% para theta
# Recordemos que estaba definido como
# [X_(n)/(1-\alpha/2)^(1/n),X_(n)/(\alpha/2)^(1/n)]

IIzq<-function(x){max(x)/(1-alpha/2)^(1/length(x))}
IDer<-function(x){max(x)/(alpha/2)^(1/length(x))}

# Encontremos los intervalos para las muestras
U1Izq<-apply(U1,2,IIzq)
U1Der<-apply(U1,2,IDer)
ICM1<-data.frame(U1Izq,U1Der)
head(ICM1)
mean(U1Der-U1Izq)

U2Izq<-apply(U2,2,IIzq)
U2Der<-apply(U2,2,IDer)
ICM2<-data.frame(U2Izq,U2Der)
head(ICM2)
mean(U2Der-U2Izq)

U3Izq<-apply(U3,2,IIzq)
U3Der<-apply(U3,2,IDer)
ICM3<-data.frame(U3Izq,U3Der)
head(ICM3)
mean(U3Der-U3Izq)

# Realicemos lo mismo, pero para theta^2

IIzq2<-function(x){(max(x)/(1-alpha/2)^(1/length(x)))^2}
IDer2<-function(x){(max(x)/(alpha/2)^(1/length(x)))^2}

# Encontremos los intervalos para las muestras
U1Izq2<-apply(U1,2,IIzq2)
U1Der2<-apply(U1,2,IDer2)
ICM12<-data.frame(U1Izq2,U1Der2)
head(ICM12)
mean(U1Der2-U1Izq2)

U2Izq2<-apply(U2,2,IIzq2)
U2Der2<-apply(U2,2,IDer2)
ICM22<-data.frame(U2Izq2,U2Der2)
head(ICM22)
mean(U2Der2-U2Izq2)

U3Izq2<-apply(U3,2,IIzq2)
U3Der2<-apply(U3,2,IDer2)
ICM32<-data.frame(U3Izq2,U3Der2)
head(ICM32)
mean(U3Der2-U3Izq2)

# Ahora veamos la intuicion detras de los intervalos de confianza
# Sabemos que theta=1, entonces podriamos preguntarnos:
# de todas nuestras simulaciones cuantas de ellas contienen al verdadero
# valor de theta

# Para theta
# Para U1
mean(ICM1$U1Izq<=1 & 1<=ICM1$U1Der)

# Para U2
mean(ICM2$U2Izq<=1 & 1<=ICM2$U2Der)

# Para U3
mean(ICM3$U3Izq<=1 & 1<=ICM3$U3Der)

# Para theta^2
mean(ICM12$U1Izq2<=1 & 1<=ICM12$U1Der2)

# Para U2
mean(ICM22$U2Izq2<=1 & 1<=ICM22$U2Der2)

# Para U3
mean(ICM32$U3Izq2<=1 & 1<=ICM32$U3Der2)

# Graficamente

library(dplyr)
library(ggplot2)
dt <- data.frame(x=1:50, y=0:1,I=U1Izq[1:50],D=U1Der[1:50],Int=(U1Izq[1:50]<=1 & 1<=U1Der[1:50]))
dt %>% 
  ggplot(aes(x=x , y=0.9,colour=Int))+
  geom_line(aes(y=1),color="black",linetype='dashed')+
  geom_errorbar(aes(ymax = D , ymin = I ))
  

  