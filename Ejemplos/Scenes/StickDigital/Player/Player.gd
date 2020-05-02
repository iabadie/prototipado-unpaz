extends KinematicBody2D

var new_motion_vector = Vector2(0,0)

func _ready():
	# Obtengo el nodo llamado StickDigital buscando en el padre (la escena WorldTest en este caso)
	# Si lo encuentra, lo conecto con el mismo (self) para recibir señales
	# en caso de que no lo encuentre, no hará la conección y no habrá movimiento
	var stickDigital = get_parent().get_node_or_null("StickDigital")
	if stickDigital != null:
		stickDigital.connect("stick_motion", self, "get_motion_vector")

func _physics_process(delta):
	# Usando el vector dirección recibido, multiplica para aumentar la fuerza de movimiento
	move_and_slide(Vector2(new_motion_vector.x * 5, new_motion_vector.y * 5))

# Funcion que se ejecuta al recibir la señal "get_motion"
# este obtiene el vector "dirección" (hacia donde apunta)
func get_motion_vector(motion):
	new_motion_vector = motion
	

