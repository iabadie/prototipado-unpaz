extends Node


## ESTE SCRIPT ES UN AUTOLOAD
## SE CARGA AL INICIAR EL JUEGO Y ES ACCESIBLE POR
## CUALQUIER OTRO SCRIPT
## SE USA PARA ALMACERA INFORMACIÓN GENERAL DEL JUEGO
## COMO EL NIVEL ACTUAL DEL JUGADOR
## UN PUNTAJE GLOBAL O TABLA DE PUNTAJES POR NIVEL


const CANTIDAD_MAXIMA_NIVELES = 10
var nivelActual = 1



var puntosTotales = 0

func formatearPuntos():
	return "X " + String(puntosTotales) 
