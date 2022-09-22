# Problema 17: 
# Nestle, produce y distribuye dos tipos de cafe a los supermercados del pais:
# cafeinado y descafeinado. Para este mes Nestle tiene 650 toneladas de grano
# de cafe en inventario y tiene programadas hasta 70 horas de tiempo de 
# procesamiento para el tostado. Cada tonelada de cafe cafeinado necesita dos
# toneladas de grano, cuatro horas de tostado y produce una ganancia de $19000.
# Cada tonelada de cafe descafeinado necesita una y media tonelada de grano, pero
# necesita seis horas de tostado y produce una ganancia de $23000. Plantee un 
# modelo de programacion lineal que le permita a Nestle planear su produccion 
# Resolución del problema de programación líneal a través del método gráfico
# para este mes. 

library(matlib)

# Asignar los coeficientes de las restricciones
# 2x1 + 1.5x2  <= 650        2   1.5     (1)
# 4x1 + 6x2    <= 70         4   6     (2)
# Definir el número de columnas en 2 y el número de filas en 2
A<-matrix(c(2,4,1.5,6), ncol = 2, nrow = 2)

# Asignar los valores del lado derecho de las desigualdades
# 2x1 + 1.5x2  <= 650        650      (1)
# 4x1 + 6x2    <= 70         70     (2)
b<- c(650,70)

plotEqn(A,b, xlim=c(0,700), labels=TRUE)


# Intersección A

# Intersección de la restriccion 2(linea roja) con el eje x2
# Se resuelve de manera matricial como ;
# 4x1 + 6x2  = 70
#  x1        =0

# entonces las matrices A y B quedan como:
# [A=
#             4     6
#             1     0
# ;B=
#             70
#             0
# ]

A <- matrix(c(4,6,1,0), nrow = 2, ncol = 2, byrow = T)
A
B <- matrix(c(70,0), nrow = 2, ncol = 1, byrow = F)
B
r <- solve(t(A)%*%A)%*%t(A)%*%B
r

#Interseccion B
#Interseccion de la restriccion 2(linea roja) con el eje de x1
#4x1 + 6x2  = 70
#     x2     = 0

# Entonces las matrices A y B quedan como:
# [A=
#             4     6
#             0     1
# ;B=
#             70
#             0
#
A <- matrix(c(4,6,0,1), nrow = 2, ncol = 2, byrow = T)
A
B <- matrix(c(70,0), nrow = 2, ncol = 1, byrow = F)
B
r <- solve(t(A)%*%A)%*%t(A)%*%B
r

#
# Definiendo la función objetivo

# Para ello escribe el código como
val<-matrix(c(0.0,11.66667,17.5,0.0), nrow=2, ncol = 2, byrow=T)
# Mostrar la matriz val
val
##      [,1]      [,2]
## [1,]    0      2
## [2,]  69.08  0.9123
## [3,]  1.5      0

FO<-matrix(c(19000,23000), nrow=2, ncol=1)
# Mostrar la matriz FO
FO
##      [,1]
## [1,]  2
###[2,]  1.5

r=val%*%FO
# Mostrar la matriz r
r

#        [,1]
#[1,] 268333.4
#[2,] 332500.0

# Como se muestra la solucion optima del sistema es 332500 con las variables 
# X1=17.5 y x2=0.0

#Conclusiones: 
#Se deben producir 17.5 toneladas de cafe cafeinado y 0 toneladas de 
#cafe descafeinado para obtener la ganancia maxima de 332500

