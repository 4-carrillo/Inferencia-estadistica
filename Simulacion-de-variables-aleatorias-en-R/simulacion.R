# INFERENCIA ESTAD?STICA
# SIMULACION DE VARIABLES ALEATORIAS
# Profesor: Gonzalo Perez de la Cruz
# Ayudante: Dioney Alonso Rosas Sanchez
# Ayudante: Alexis Adrian Carrillo Medina

# Recuerden que antes de iniciar un nuevo script de R es recomendable
# borrar todos los objetos del ambiente para no causar errores.
# Para ello podemos ejecutar el siguiente codigo
rm(list = ls(all.names =  TRUE)) 
gc()


########################## DISTRIBUCIONES ##########################


# Para ver cuales son las distribuciones que hay en R por default:
?distributions

# dnorm : Funci?n de Densidad de Probabilidad (PDF en ingl?s).
# pnorm : Funci?n de Distribuci?n de Probabilidad (CDF en ingl?s; probabilidad acumulada).
# qnorm : Funci?n de Cuantiles.
# rnorm : Generador aleatorio de n?meros con distribuci?n normal.


# dnorm (funcion de densidad f)
# Es la funci?n con forma de campana que la mayor?a conocemos.
# Calcula para cada punto observado el valor de la funci?n de densidad.

dnorm(0) # Nos regresa el valor de la distribucion en 0 de una normal(0,1)
dexp(1,rate=2) # Nos regresa el valor de la distribucion en 1 de una exponencial(2)

plot(dnorm(seq(-10,10,0.1)),type="l") # Grafica de la campana de Gauss

# pnorm (funci?n de distribucion F)
# Es la funci?n que describe P(Y <= X) probabilidad de que Y sea
# menor o igual a X, siendo X cualquier valor en el dominio e Y una variable aleatoria
# tomada de una distribuci?n normal.
# Recuerden que se encuentra entre 0 y 1.

pnorm(0) # Valor de la funcion de distribucion de una normal(0,1) en 0
punif(5,min=0,max=7) # Valor de la funcion de distribucion de una Uniforme(0,7) en 5

plot(pnorm(seq(-10,10,0.1)), type="l") # Funcion de distribucion de una normal(0,1)

# qnorm es la funcion que utilizamos para encontrar los cuantiles de una 
# normal

qnorm(.5) #Cuantil al 50% (tambien conocido como la mediana)
qbeta(0.2,shape1=1/2,shape2 = 1/2) #Cuantil al 20% de una Beta(1/2,1/2)

plot(qbeta(seq(0,1,0.01),shape1=1/2,shape2 = 1/2),type="l")

# rnorm es la funcion utilizada para simular numeros aleatorios
# En este caso de una normal
#Antes de simular, fijemos una semilla
set.seed(2)

rnorm(5) # 5 variables aleatorias normales(0,1)
rt(7,df=4) # 7 variables aleatorios t-student con 4 grados de libertad

plot(rt(90,df=1)) # Grafica de 90 variables t-student(1)

# Veamos si encaja con la densidad
plot(seq(-10,10,0.01),dt(seq(-10,10,0.01),df=1),type="l")


x<-rt(1000,df=2) #Simulamos 100 t-student
mean(x) #Deberia encajar con la esperanza de una t-student(2)
plot(density(x)) #Deberia encajar con la densidad

#Otra forma de graficar funciones es con la funcion curve
curve(dbeta(x,shape1=1/2,shape2 = 1/2),from=0,to=1)
curve(qnorm(x),from=0,to=1)

#Podemos combinar todo lo visto para crear lo siguiente
x <- rgamma(1000,rate=1,shape=1)
hist(x,col="blue",freq=F)
lines(density(x),col="pink",lw=2)
curve(dgamma(x,rate = 1,shape=1),lw=2,add=T,col="red")
legend(x="topright",legend=c("Empirica","Teorica"),lty = 1,col=c("pink","red"))

