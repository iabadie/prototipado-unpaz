extends CanvasLayer

## esta forma de declarar variables es cuadno en la variable queremos almacenar alguno de los nodos hijos como el Label o la Progressbar
## onready var significa que esa variable solo podrá ser utilizada cuadno el nodo padre y sus hjos estén cargados
## es decir, ready
onready var LabelObjetos = $Control/MarginContainer/ContenedorDeUI/ContenedorObjetos/Label
onready var Progressbar = $Control/MarginContainer/ContenedorDeUI/ProgressBar

func _ready():
	LabelObjetos.text = Puntajes.formatearPuntos()
	Progressbar.value = 100


var contador = 0 ## eso lo agregue solo para hacer un fake timer de a 50 pasos

func _process(delta):
	contador += 1
	if contador == 50:
		contador = 0
		Progressbar.value -= 5 ## manipulamos a mano el valor del progressbar, también se podría hacer un con Tween (investigar)
		
		Puntajes.puntosTotales += 1 # aumentamos el valor de esta variable global guardada en el autoload
		LabelObjetos.text = Puntajes.formatearPuntos() ## Utilizamos la función del scrip Puntajes que es un autoload
