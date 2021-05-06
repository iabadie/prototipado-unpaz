extends KinematicBody2D

const MOVIMIENTO = "movimiento"
const RESORTE = "resorte"

const COLUMNA_VELOCIDAD = 200
const MOVIMIENTO_VELOCIDAD = 200

var estado = MOVIMIENTO
var velocity = Vector2(0,0)

var esta_en_columna = false

func _physics_process(delta):
	if estado == MOVIMIENTO:
		mover_estado_movimiento()
	elif estado == RESORTE:
		mover_estado_resorte(delta)
		

func mover_estado_resorte(delta):
	if esta_en_columna:
		velocity.x = 0
		if velocity.y == 0:
			velocity.y = COLUMNA_VELOCIDAD
		var colision = move_and_collide(velocity * delta)
		if colision:
			velocity.y = colision.normal.y * COLUMNA_VELOCIDAD 
	else:
		move_and_slide(velocity)

func mover_estado_movimiento():
	velocity.y = 0
	if Input.is_action_pressed("ui_left"):
		velocity.x = -MOVIMIENTO_VELOCIDAD
	if Input.is_action_pressed("ui_right"):
		velocity.x = MOVIMIENTO_VELOCIDAD
	move_and_slide(velocity)

func _on_DetectorSalidaIzqueirda_area_entered(area):
	if Input.is_action_pressed("ui_left") and velocity.y < 0:
		esta_en_columna = false
		velocity.y = 0
		velocity.x = -MOVIMIENTO_VELOCIDAD
		estado = MOVIMIENTO


func _on_DetectorSalidaDerecha_area_entered(area):
	if Input.is_action_pressed("ui_right") and velocity.y < 0:
		esta_en_columna = false
		velocity.y = 0
		velocity.x = MOVIMIENTO_VELOCIDAD
		estado = MOVIMIENTO


func _on_DeteccionCentro_area_entered(area):
	esta_en_columna = true
	velocity.x = 0
	estado = RESORTE
	pass
