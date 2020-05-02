## Autoload
Autoload nos permite tener un script que será manejado a nivel global, es decir, se podrán modificar variables globales, leer variables globales y utilizar funciones globales, desde cualqueir lado.

Los autoloads se cargan al inicializar el proyecto (no importa que escena se cargue, es un script del proyecto)

Para crear un "Singleton" (nombre de los scripts unicos y globales) tenemos que crear un script (desde la secciónd e scripts) y luego desde la configuraciónd e proyectos, en la pestaña de "Autoload" agregar dicho script con un nombre.

Este nombre será el utilizado para acceder a todas las variables y funciones del script global.