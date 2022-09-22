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

# Paso 1: Identificar las variables básicas
# x1 = Cantidad de produccion de cafe cafeinado 
# x2 = Cantidad de produccion de cafe descafeinado 

# Paso 2: Identificar las variables "cj"
# c1 = $ 19000 
# c2 = $ 23000   

# Paso 3: Función objetivo
# Max z = ($19000/C.C.)(x1C.C.) + ($23000/C.D.)((x2C.D.)
# Max z = 19000x1 + 23000x2

# Paso 4: Identificar "bj"
# b1 = Cantidad de toneladas de grano de cafe (650).
# b2 = Cantidad de horas de procesamiento para el tostado (70).

# Paso 5: Identificar "aij"
# b1 = Cantidad de madera disponible (650).
# * 2 para producir cafe cafeinado
# * 1.5 para producir cafe descafeinado
# b2 = Cantidad de horas de procesamiento para el tostado (70).
# * 4 horas de tostado 
# * 6 horas de tostado 

# Paso 6: Armar restricciones
# (2 m2/C.C.)(x1C.C.) + (1.5 C.D.)(x2C.D.)
# 2x1 + 1.5x2 <= 650

# (4 hrs/C.C.)(x1C.C.) + (6 hrs/C.D)(x2C.D)
# 4X1 + 6x2 <= 70

# Paso 7: No negatividad
# x1, x2 >= 0

# Paso 8: Modelo general
# Max z = 19000x1 + 23000x2
# s.a.
# 2x1 + 1.5x2 <= 650  (1)
# 4X1+6x2     <= 70   (2)  
#       x1,x2 >= 0 (3)

# Paso 9 Resolver el sistema

#
#install.packages("lpSolve")

# Importar la libreria
library(lpSolve)

# Se guardan en una matriz los coeficientes de la función objetivo
funcion_objetivo <- c(19000,23000)
funcion_objetivo
# Asignar los coeficientes de las desigualdades
# 2x1 + 1.5x2  <= 650        2   1.5     (1)
# 4x1 + 6X2    <= 70         4    6      (2)
# Definir el número de filas en 2
restriciones_derecho <- matrix(c(2,1.5,4,6), nrow = 2, byrow = T)

# Se muestra el valor de la matriz
restriciones_derecho

# Se guarda en una matriz los simbolos de las desigualdades
restriccion.direccion <- c("<=", "<=")
restriccion.direccion
# Asignar los valores del lado derecho de las desiguldades
# 6x1 + 8x2  <= 650         650       (1)
# 4x1 + 6X2  <= 70          70       (2)
#        
lado_derecho.restriccion <- c(650,70)
lado_derecho.restriccion
# Se ejecuta la instrucción para mostrar el resultado que maximize la función
lp(direction = "max", objective.in = funcion_objetivo, const.mat =restriciones_derecho, const.dir = restriccion.direccion, const.rhs = lado_derecho.restriccion, int.vec = c(1, 2, 3, 4, 5), all.int = T)

# Se ejecuta la instrucción para mostrar los valores de x1 y x2.
lp(direction = "max", objective.in = funcion_objetivo, const.mat =restriciones_derecho, const.dir = restriccion.direccion, const.rhs = lado_derecho.restriccion, int.vec = c(1, 2, 3, 4, 5), all.int = T)$solution

# Argumentos más usados: 

# direction: Variable cadena de caracteres que indica la dirección de optimización:
# "min" (por defecto) o "max". 

# objective.in: Vector numérico con los coeficientes de la función objetivo. 

# const.mat: Matriz con los coeficientes numéricos de las restricciones, una fila por
# restricción, una columna por variable (a menos que transpose.constraints = FALSE; ver 
# más adelante) 

# const.dir: Vector de cadenas de caracteres que indica la dirección de las restricciones.
# Los valores pueden ser "<", "<=", "= ", ">" o ">=". 

# const.rhs: Vector con los valores numéricos del lado derecho de las restricciones

# transpose.constraints: Por defecto cada restricción ocupa una fila de const.mat, y tal
# matriz necesita trasponerse antes de pasar al código de optimización. Cuando se tiene un
# tamaño grande de matrices de restricciones es aconsejable construir la matriz de
# restricciones por columnas. En tal caso, se debe poner transpose.constraints= FALSE. 

# int.vec: Vector numérico que da los índices de las variables que deben ser enteras. La
# longitud de este vector debe ser igual al número de variables enteras.

# compute.sens: Valor numérico, respuesta a la pregunta ¿calculo sensibilidad? Si es un
# valor distinto de cero, calcula la sensibilidad. Por defecto vale cero.

# binary.vec: Vector numérico como int.vec que da los índices de las variables que
# deben ser binarias.

# all.int: Carácter lógico: Respuesta a la pregunta ¿son todas la variables enteras? Por
# defecto: FALSE. 

# all.bin: Carácter lógico: Respuesta a la pregunta ¿son todas la variables binarias? Por
# defecto: FALSE. 

# Valor: Un objeto de clase lp, una lista que contiene, entre otros, los siguientes elementos:
# direction: La dirección de optimización del problema

# x.count: Número de variables en la función objetivo

# objective: Vector con los coeficientes de la función objetivo

# const.count: Número de restricciones

# constraints: Matriz de tasas de uso

# int.count: Número de variables enteras

# int.vec: Vector con los índices de las variables enteras

# bin.count: Número de variables binarias

# binary.vec: Vector con los índices de las variables binarias

# objval: Valor óptimo de la función objetivo

# solution: Vector con los valores óptimos

# compute.sens: Proporciona el valor numérico a la pregunta ¿calculo sensibilidad?
# que se dio en la llamada a la función. Si es un valor distinto de cero, el objeto contiene
# los resultados del análisis de sensibilidad.

# sens.coef.from: Proporciona los límites inferiores de los intervalos de variación de
# los coeficientes de la función objetivo, para que la solución proporcionada siga siendo
# óptima.

# sens.coef.to: : Proporciona los límites superiores de los intervalos de variación de los
# coeficientes de la función objetivo, para que la solución proporcionada siga siendo
# óptima.

# duals: Proporciona los valores de los costos reducidos en la tabla óptima del Simplex.

# duals.from: Proporciona los límites inferiores de los intervalos de variación de los
# coeficientes de la función objetivo del problema dual (o equivalentemente, de los
# recursos del problema primal), para que la solución proporcionada siga siendo óptima.

# duals.to: Proporciona los límites superiores de los intervalos de variación de los
# coeficientes de la función objetivo del problema dual (o equivalentemente, de los
# recursos del problema primal), para que la solución proporcionada siga siendo óptima.

# status: Número que indica: 0= éxito, 2=solución no factible, 3=solución no acotada.
