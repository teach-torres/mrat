## El intérprete de Python

El intérprete de Python es un programa que lee las declaraciones del programa de Python y las ejecuta inmediatamente. Para utilizar el intérprete, debe abrir una ventana de terminal o un indicador de comando en su estación de trabajo. El intérprete opera en dos modos.

### Modo interactivo

Puede utilizar el intérprete como herramienta interactiva. En el modo interactivo, ejecuta el programa Python y verá un nuevo indicador, >>>, y luego puede ingresar las declaraciones de Python una por una. En Microsoft Windows, puede que veas algo como esto:

``` 
C:\Users\Paul>python
Python 3.4.3 (v3.4.3:9b73f1c3e601, Feb 24 2015, 22:43:06) [MSC v.1600 32 bit
(Intel)] on win32
Type "help", "copyright", "credits" or "license" for more information.
>>> _
``` 

El intérprete ejecuta las declaraciones del programa inmediatamente. El modo interactivo es realmente útil cuando quieres experimentar o probar cosas. Por ejemplo, a veces necesita ver cómo se comporta una función en particular (que no ha usado antes). En otras ocasiones, es posible que deba ver exactamente lo que hace un trozo de código de forma aislada.

### Modo de línea de comandos

En el modo de línea de comandos, el programa Python aún se ejecuta en la línea de comandos, pero agrega el nombre de un archivo (que contiene su programa) al comando:

``` shell
python myprogram.py
``` 

El intérprete lee el contenido del archivo (myprogram.py en este caso), escanea y valida el código, compila el programa y luego ejecuta el programa. Si el intérprete encuentra una falla en la sintaxis de su programa, reportará un error de compilación. Si el programa falla durante la ejecución, verá un error de tiempo de ejecución. Si el programa se ejecuta con éxito, verá la (s) salida (s) del programa.

No necesita preocuparse por cómo el intérprete hace lo que hace, pero sí necesita estar familiarizado con los tipos de mensajes de error que produce. Usamos el modo de línea de comandos para ejecutar nuestros programas en archivos.


## Codificación, pruebas y depuración de programas Python

La secuencia normal de pasos al crear un nuevo programa es la siguiente:

1. Cree un nuevo archivo .py que contendrá el programa Python (a veces llamado código fuente).
2. Edite su archivo .py para crear un nuevo código (o modificar un código existente) y guarde el archivo.
3. Ejecute su programa en el símbolo del sistema para probarlo e interprete el resultado.
4. Si el programa no funciona según lo requerido, o si necesita agregar más funciones, averigüe qué cambios son necesarios y vaya al Paso 2.


Por lo general, es una buena idea documentar su código con comentarios. Esto es parte del proceso de edición, Paso 2. Si necesita realizar cambios en un programa que funciona, nuevamente, comience en el Paso 2.

Escribir nuevos programas a menudo se llama codificación. Cuando sus programas no funcionan correctamente, hacer que los programas hagan exactamente lo que usted quiere que hagan, a menudo se llama depuración.

## Comentarios, bloques de código y sangría

Python, como todos los lenguajes de programación, tiene convenciones que debemos seguir. Algunos lenguajes de programación usan puntuación como llaves ({}) y punto y coma (;) para estructurar bloques de código. Python es algo diferente (y más fácil para el ojo) porque usa espacios en blanco y sangría para definir la estructura del código. A veces, el código necesita una pequeña explicación, por lo que usamos comentarios para ayudar a los lectores del código (incluido usted) a entenderlo.

Introducimos sangría y comentarios con algunos ejemplos.

``` python
# Cualquier texto que aparezca después de un carácter hash (#) es 
# ignorado por el intérprete y tratado como un comentario. Usamos 
# comentarios para proporcionar documentación.

#
# some text after hashes
#
brdr = 2 # thick border

# El carácter de dos puntos (:) denota el final de una línea de 
# encabezado que marca un bloque de código. Las declaraciones que 
# siguen a la línea del encabezado deben estar sangradas.

def my_func(a, b, c):
    d = a + b + c
...
...

# Los dos puntos se usan con más frecuencia al final de if, elif, 
# else, while, y para sentencias y definiciones de funciones (que 
# comienzan con la palabra clave def).

if this_var==23:
    doThis()
    doThat()
    ...
else:
    do_other()
    ...

# En este ejemplo, el texto entre comillas es una cadena de 
# caraceres. Este texto es lo que un comando de ayuda 
# (addTwoNumbers) mostraría en el intérprete interactivo.

def addTwoNumbers(a, b):
    "adds two numbers"
    return a + b

# El carácter de barra invertida (\) al final de la línea 
# indica que la instrucción se extiende a la línea siguiente. 
# Algunas declaraciones muy largas podrían extenderse sobre 
# varias líneas.

if long_var is True && \
    middle==10 && \
    small_var is False:
    ...
    ...

``` 

La sangría se logra con mayor frecuencia utilizando incrementos de cuatro espacios.

``` python
a = b + c ; p = q + r

a = b + c
p = q + r

``` 

El carácter de punto y coma (;) se puede utilizar para unir varias declaraciones en una sola línea. La primera línea es equivalente a las dos líneas que la siguen.

## Variables

Una variable es una ubicación con nombre en la memoria del programa que se puede usar para almacenar algunos datos. Hay algunas reglas para nombrar variables:

* El primer carácter debe ser una letra o un guión bajo (\_).
* Los caracteres adicionales pueden ser alfanuméricos o de subrayado.
* Los nombres distinguen entre mayúsculas y minúsculas.

### Operaciones de asignación comunes

Cuando almacenas datos en una variable se llama asignación. Una declaración de asignación coloca un valor o el resultado de una expresión en variable(s). El formato general de una tarea es:


``` python
var = expression

``` 

Una expresión puede ser un literal, un cálculo, una llamada a una función o una combinación de los tres. Algunas expresiones generan una lista de valores; por ejemplo:


``` python
var1, var2, var3 = expression

``` 

Aquí hay algunos ejemplos más:


``` python
>>> # 3 into integer myint
>>> myint = 3
>>>
>>> # a string of characters into a string variable
>>> text = 'Some text'
>>> # a floating point number
>>> cost = 3 * 123.45
>>> # a longer string
>>> Name = 'Mr' + ' ' + 'Fred' + ' ' + 'Bloggs'
>>> # a list
>>> shoppingList = ['ham','eggs','mushrooms']
>>> # multiple assignment (a=1, b=2, b=3)
>>> a, b, c = 1, 2, 3

``` 


### Otras operaciones de asignación

La asignación aumentada proporciona una notación ligeramente más corta, donde una variable tiene su valor ajustado de alguna manera.

Esta asignación es equivalente a

Colons can be used to align columns.

<!--
| Tables        | Are           | Cool  |
| ------------- |:-------------:| -----:|
| col 3 is      | right-aligned | $1600 |
| col 2 is      | centered      |   $12 |
| zebra stripes | are neat      |    $1 |
-->

| Esta asignación | es equivalente a | 
| --------------- |:-----------------| 
| x+=1            | x = x + 1        |
| x-=23           | x = x – 23       |
| x/=6            | x = x / 6        |
| x*=2.3          | x = x * 2.3      |

La asignación múltiple proporciona una notación ligeramente más corta, donde varias variables reciben el mismo valor a la vez.

| Esta asignación | es equivalente a | 
| --------------- |:-----------------| 
| a = b = c = 1   | a = 1            |
|                 | b = 1            |
|                 | c = 1            | 

La llamada asignación múltiple proporciona una notación ligeramente más corta, donde varias variables reciben sus valores a la vez.

| Esta asignación | Explicación      |
| --------------- |:-----------------| 
| x, y, z = 99, 100, 'OK' | Resulta en:              |
|                         | x=99, y= 100, and z='OK' |
| p, q, r = myFunc()      | Si myFunc () devuelve tres |
|                         | valores, p, q y r se les |
|                         |asignan esos tres valores.|

