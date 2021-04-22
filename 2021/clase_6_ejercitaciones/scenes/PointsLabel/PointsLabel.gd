extends Node2D

export (int) var puntajeInicial = 0

func _ready():
	Puntajes.puntaje = puntajeInicial
	$Label.text = Puntajes.formatear_puntaje()
	position = Vector2(30, 30)
	scale = Vector2(3, 3)

func sumar(cantidad):
	Puntajes.puntaje += cantidad;
	$Label.text = Puntajes.formatear_puntaje()
