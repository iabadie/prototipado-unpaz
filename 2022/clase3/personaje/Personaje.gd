extends KinematicBody2D

const VALOR_DE_VELOCIDAD = 20;
const VELOCIDAD_MAXIMA = 400;
const GRAVITY = 10;
const MAX_JUMPS = 2;
var velocity = Vector2(0,0);

var jumps = 0;

var cantidadRecolectados = 0;


func _physics_process(delta):
	if is_on_floor():
		jumps = 0;
		velocity.y = 0;
	else:
		velocity.y += GRAVITY;
	
	if Input.is_action_just_pressed("ui_up") and jumps < MAX_JUMPS:
		jumps += 1
		velocity.y = -20 * VALOR_DE_VELOCIDAD
	
	if Input.is_action_pressed("ui_left"):
		velocity.x = -VELOCIDAD_MAXIMA
	if Input.is_action_pressed("ui_right"):
		velocity.x = VELOCIDAD_MAXIMA
	
	if Input.is_action_just_released("ui_left") or Input.is_action_just_released("ui_right"):
		velocity.x = 0
		
	move_and_slide(velocity, Vector2.UP)


func _on_AreaDelPLayer_area_entered(area):
	cantidadRecolectados += 1;
	$Puntos.text = "RECOLECTADOS:  " + String(cantidadRecolectados);
	pass
