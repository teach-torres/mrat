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
