# Generalidades

En esta sección se presenta a modo de introducción un ejemplo de modelación con AER-
MOD, el cual ayudará a entender como se configura el sistema de modelación. Este ejemplo
ilustra el uso de las opciones más empleadas.

El ejemplo presentado en esta sección es una aplicación típica de los problemas que se
pueden modelar para una única fuente puntual. La fuente es una chimenea cuya altura
no cumple el criterio de Buenas Prácticas de Ingeniería (BPI), que se encuentra en terreno
rural. Puesto que la altura es inferior a la recomendada por BPI, las emisiones de la fuen-
te están sujetas a la influencia del lavado aerodinámico debido a edificaciones cercanas.
Este tutorial conduce al usuario en un proceso de selección y especificación de opciones
de modelación, en el detalle de los parámetros de la fuente, localización de los receptores,
ingreso de datos meteorológicos, y selección de opciones de salida de los resultados.

El archivo de ingreso de datos del modelo AERMOD utiliza palabras claves o etiquetas,
para especificar las opciones e ingreso de datos para la ejecución del modelo. Las etique-
tas son secciones del archivo que actúan como lenguaje de comandos a través del cual el
usuario se comunica con el programa. Las etiquetas especifican el tipo de opción o ingreso
de datos que se introduce en cada línea del archivo de ingreso de datos, y los parámetros
que lo siguen definen las opciones específicas seleccionadas.

El archivo de flujo de datos está dividido en cinco (5) rutas funcionales. Estas 
rutas funcionales se identifican con dos caracteres-ID puestos al comienzo y al 
final de cada ruta. Las rutas y el orden en que se introducen al modelo son las 
que se enuncian a continuación:

```terminal
CO - para especificar las opciones de COntrol de ejecución,
SO - para especificar información de la fuente (SOurce),
RE - para especificar información del REceptor,
ME - para especificar información MEteorológica,
EV - para especificar información de EVentos,
OU - para especificar opciones de salidas (OUtput)
```

Cada línea del archivo de flujo de ejecución consta de una ruta-ID, una palabra 
clave de 8 carácteres, y una lista de parámetros, a continuación se muestra un 
ejemplo.

## Reglas generales para estructurar un archivo de flujo de ejecución

Una de las reglas más básicas es que todas las entradas para una ruta específica deben
ser continuas, i.e., todas la entradas para la ruta CO deben ser primero, seguidas de las
entradas para la ruta SO, así sucesivamente. El comienzo de cada ruta empieza con la
etiqueta STARTING, y la ruta debe finalizar con la ruta FINISHED, de modo que el primer
registro funcional de cada archivo de datos de entrada debe ser CO STARTING y el último
registro de este archivo de datos de de entrada sea OU FINISHED.

Cada registro en la entrada del archivo de flujo de ejecución (o datos) es 
denominado "imagen" del flujo de ejecución. La información en cada imagen de 
entrada consta de una "ruta", una "etiqueta" y uno o más parámetros. Cada uno 
de estos "campos" en la imagen del flujo de ejecución debe estar separado de 
otro campo por al menos un espacio en blanco. Para simplificar la interpretación 
de la imagen del flujo de ejecución para el modelo, el archivo de flujo de 
ejecución debe estar estructurado con los dos caracteres de ruta en las columnas 
1 y 2, una etiqueta con ocho caracteres en las columnas 4 a 11, seguido por los 
parámetros en columnas 13 hasta la 132, cuando sea necesario. Para muchas etiquetas, 
el orden de los parámetros seguidos de la etiqueta es importante -- el espaciado 
exacto de los parámetros no es importante, siempre que sean separados unos de 
otros por al menos un espacio en blanco y no se extienda más allá del límite de 
132 caracteres. 

Los caracteres alfabéticos pueden ser ingresados en letras mayúsculas o 
minúsculas. El programa convierte todos los caracteres de entrada en mayúsculas, 
con la excepción de los campos del título y el nombre de los archivos. Por convención 
se recomienda utilizar mayúsculas. Para el ingreso de datos, se asume que se 
introducen en unidades métricas, i.e., longitud en metros, velocidad en metros por 
segundo, temperatura en Kelvin, y emisión en gramos por segundo. En contadas 
ocasiones, el usuario tiene la opción de especificar pies para unidades de 
longitud, y el programa realizará la conversión en metros. Estas excepciones 
son para el ingreso de la altura de los receptores y escala de altura de 
montañas para terrenos elevados, teniendo en cuenta que estos valores son 
a menudos disponibles en pies.

Ciertas etiquetas son obligatorias y deben estar presentes en el archivo de 
flujo de ejecución, como la etiqueta MODELOPT, la cual identifica las 
opciones de modelación. Otras etiquetas son opcionales y son necesarias únicamente para 
opciones particulaes, como la opciòn que permite en ingreso de alturas de bandera 
para la altura de los receptores. Algunas etiquetas son repetibles, como las 
etiquetas para especificar los parámetros de las fuentes, mientras que otras 
etiquetas solamente aparecen una vez.

Con pocas excepciones, el orden de las etiquetas dentro de cada ruta no es 
crítica. Para la ruta SO, la etiqueta LOCATION se debe introducir antes que otras 
etiquetas para una fuente en particular, y la etiqueta \texttt{SRCGROUP} debe ser la 
última etiqueta antes de SO FINISHED. Para las etiquetas de la ruta SO que 
acepten un rango de fuentes IDs, los parámetros detallados de las fuentes por 
estas etiquetas solamente aplicarán para las fuentes previamente definidas, y 
excluirá cualquier fuente que sea indicada después.

A continuación se dan algunas recomendaciones para incrementar la flexibilidad 
al usuario en la estructuración de los archivos de entrada. Una recomendación 
es permitir el uso de espacios en blanco. Esto permite al usuario separar las 
etiquetas unas de otras, o separar un grupo de imágenes, como la localización 
de las fuentes, de otras imágenes. Otra recomendación, es el uso de "comentarios 
en línea", identificados por \** en el campo de la ruta. Cualquier imagen de 
entrada que tenga \** antes de la ruta ID será ignorado por el programa. Esto 
es especialmente útil para etiquetar líneas del documento. También se pueden 
utilizar para convertir en comentarios ciertas opciones de una ejecución en 
particular sin borrar las opciones y los datos asociados (e.g., alturas de 
terrenos elevados).

Otra razón, es para mejorar la lectura del manejo detallado de errores que ha 
sido construido para el programa. El modelo suministra descripción de la localización 
y naturaleza de todos los errores encontrados para una ejecución en particular. 
En lugar de detener la ejecución en un error encontrado en el archivo de entrada, 
el modelo continua leyendo para procesar todos los registros de entrada y reporta 
todos los errores encontrados. Si ocurren un error fatal, el programa no ejecutará 
los cálculos de modelación.

## Uso de opciones regulatorias

La opción regulatoria DFAULT es controlada desde la etiqueta MODELOPT en la ruta CO. 
Como su nombre lo indica, esta etiqueta controla las opciones de selección del modelo. 
Es una etiqueta de uso obligatorio, no repetible, y especialmente importante para 
entender y controlar la operación del modelo AERMOD. A menos que se especifique otra 
cosa utilizando etiquetas disponibles, el modelo implementa las siguientes opciones 
por defecto:

-> Uso de algoritmos de terreno elevado requiriendo el ingreso datos de terreno de altura, 
-> Uso de lavado de extremos de chimenea (excepto para casos de lavado de edificaciones), 
-> Uso de rutinas de procesamiento de calmas, 
-> Uso de rutinas de procesamiento de datos faltantes, 
-> Uso de vida media de 4-h para el decaimiento exponencial de SO2 para fuentes urbanas. 

Los parámetros utilizados para las opciones en la etiqueta MODELOPT son cadenas de 
caracteres, llamadas "etiquetas secundarias", que describen las opciones que son 
seleccionadas. Por ejemplo, para asegurar que el modelo utilice la opción regulatoria 
por defecto, el usuario debe incluir la etiqueta secundaria DFAULT en MODELOPT. La 
presencia de esta etiqueta dice al programa que anule cualquier intento de utilizar 
una opción no-regulatoria. El programa alertará al usuario si se selecciona una opción 
no-regulatoria con la opción DFAULT, pero no detendrá el proceso. Para aplicaciones de 
modelación regulatoria se sugiere emplear DFAULT, aún a pesar de que se utilicen 
opciones nmo-regulatorias. 

Para cualquier aplicación que utilice la opción no-regulatoria, no utilizar la 
opción DFAULT. Las opciones no-regulatorias tambieén son especificadas con etiquetas 
secundarias; por ejemplo, NOSTD llama la opción de no emplear lavado de chimenea. 

#  Configuración de una archivo de flujo de ejecución

A continuación se muestra un ejemplo de construcción de una aplicación, ilustrando 
las opciones más utiliadas en el modelo AERMOD. El ejemplo, consisten en una 
aplicación industrial simple. El archivo ejemplo se muestra en la siguiente figura 
y en la sección siguiente se explican las partes de que compone el archivo.

```terminal
CO STARTING 
CO TITLEONE A Simple Example Problem for the AERMOD-PRIME Model

CO MODELOPT CONC FLAT 
CO AVERTIME 3 24 PERIOD 
CO POLLUTID SO2 
CO RUNORNOT RUN 
CO FINISHED 
SO STARTING 
SO LOCATION STACK1 POINT 0.0 0.0 0.0 
SO SRCPARAM STACK1 500.0 65.00 425. 15.0 5. 
SO BUILDHGT STACK1 36*50. 
SO BUILDWID STACK1 62.26 72.64 80.80 86.51 89.59 89.95 
SO BUILDWID STACK1 87.58 82.54 75.00 82.54 87.58 89.95 
SO BUILDWID STACK1 89.59 86.51 80.80 72.64 62.26 50.00 
SO BUILDWID STACK1 62.26 72.64 80.80 86.51 89.59 89.95 
SO BUILDWID STACK1 87.58 82.54 75.00 82.54 87.58 89.95 
SO BUILDWID STACK1 89.59 86.51 80.80 72.64 62.26 50.00 
SO BUILDLEN STACK1 82.54 87.58 89.95 89.59 86.51 80.80 
SO BUILDLEN STACK1 72.64 62.26 50.00 62.26 72.64 80.80 
SO BUILDLEN STACK1 86.51 89.59 89.95 87.58 82.54 75.00 
SO BUILDLEN STACK1 82.54 87.58 89.95 89.59 86.51 80.80 
SO BUILDLEN STACK1 72.64 62.26 50.00 62.26 72.64 80.80 
SO BUILDLEN STACK1 86.51 89.59 89.95 87.58 82.54 75.00 
SO XBADJ STACK1 -47.35 -55.76 -62.48 -67.29 -70.07 -70.71 
SO XBADJ STACK1 -69.21 -65.60 -60.00 -65.60 -69.21 -70.71 
SO XBADJ STACK1 -70.07 -67.29 -62.48 -55.76 -47.35 -37.50 
SO XBADJ STACK1 -35.19 -31.82 -27.48 -22.30 -16.44 -10.09 
SO XBADJ STACK1 -3.43 3.34 10.00 3.34 -3.43 -10.09 
SO XBADJ STACK1 -16.44 -22.30 -27.48 -31.82 -35.19 -37.50 
SO YBADJ STACK1 34.47 32.89 30.31 26.81 22.50 17.50 
SO YBADJ STACK1 11.97 6.08 0.00 -6.08 -11.97 -17.50 
SO YBADJ STACK1 -22.50 -26.81 -30.31 -32.89 -34.47 -35.00 
SO YBADJ STACK1 -34.47 -32.89 -30.31 -26.81 -22.50 -17.50 
SO YBADJ STACK1 -11.97 -6.08 0.00 6.08 11.97 17.50 
SO YBADJ STACK1 22.50 26.81 30.31 32.89 34.47 35.00 
SO SRCGROUP ALL 
SO FINISHED 
RE STARTING 
RE GRIDPOLR POL1 STA 

RE GRIDPOLR POL1 ORIG STACK1 
RE GRIDPOLR POL1 DIST 175. 350. 500. 1000. 
RE GRIDPOLR POL1 GDIR 36 10 10 
RE GRIDPOLR POL1 END 
RE FINISHED 

ME STARTING 
ME SURFFILE AERMET2.SFC 
ME PROFFILE AERMET2.PFL 
ME SURFDATA 14735 1988 ALBANY,NY
ME UAIRDATA 14735 1988 ALBANY,NY
ME PROBATE 0.0 METERS 
ME FINISHED 

OF STARTING 
OF RECTABLE ALIVE FIRST-SECOND 
OF MAXTABLE ALIVE 50 
OF FINISHED 
```
