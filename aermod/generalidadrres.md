# Generalidades

n esta sección se presenta a modo de introducción un ejemplo de modelación con AER-
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

