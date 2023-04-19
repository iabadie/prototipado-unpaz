extends Control

func recrear_texto():
	$Label.text = Sistema.obtenerTextoDePuntos()

func _ready():
	recrear_texto();

func _process(delta):
	recrear_texto()
