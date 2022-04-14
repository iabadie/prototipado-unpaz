extends Label


var score = 0;

func _ready():
	text = "PUNTOS: " + String(score);


func aumentar_puntaje(cantidadPuntos):
	score += cantidadPuntos;
	text = "PUNTOS: " + String(score);
