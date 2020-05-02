extends KinematicBody2D

var new_motion_vector = Vector2(0,0)

func _ready():
	# Obtengo el nodo HERMANO para la escena del mundo
	# Y lo conecto con el mismo (self) para recibir señales
	# ".." significa desde la posicion actual, un nivel atras en el arbol
	var analogico = get_node("../analogico")
	analogico.connect("get_motion", self, "get_motion_vector")

func _physics_process(delta):
	move_and_slide(Vector2(new_motion_vector.x * 5, new_motion_vector.y * 5))

# Funcion que se ejecuta al recibir la señal "get_motion"
func get_motion_vector(motion):
	new_motion_vector = motion
	

