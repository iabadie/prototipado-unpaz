extends KinematicBody2D

# Declaración de variables y constantes
const V_VEL_STEPS = 20; # Número de aumento gradual de velocidad vertical
const H_VEL = 100; # Velocidad horizontal fija
const V_MAX_VEL = 200; # Velocidad vertical máxima a alcanzar

var velocity = Vector2(0, 0);


# Declaración de funciones y comportamientos
func _ready():
	pass


func _physics_process(delta):
	if Input.is_action_pressed("ui_up") and velocity.y > -V_MAX_VEL:
		velocity.y -= V_VEL_STEPS;
	if Input.is_action_pressed("ui_down") and velocity.y < V_MAX_VEL:
		velocity.y += V_VEL_STEPS;
	if Input.is_action_just_pressed("ui_right"):
		position = Vector2(80, 300) 
		velocity.x = H_VEL;
	
	move_and_slide(velocity);
	pass
		
