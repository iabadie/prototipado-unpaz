extends Node2D

export (Vector2) var posicion1
export (Vector2) var posicion2
export (Vector2) var posicion3
export (Vector2) var posicion4

export (int) var velocidad

var posicionDestino

func _ready():
	posicionDestino = posicion1
	mover()

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		# ESTUNEA
		$Tween.stop_all()
		$Area2D/CollisionShape2D.disabled = true
	if Input.is_action_just_pressed("ui_left"):
		# VUELVE A LA NORMALIDAD
		$Area2D/CollisionShape2D.disabled = false
		mover()
	
	## ESTO ES LO DEL TOUCH PERO NO EXISTE EN ESTE EJEMPLO
	var event = null
	if event == InputEventScreenTouch and event.pressed():
		print("TOUCH SCREEN")
	## -------------------------
	pass

func mover():
	var tiempo = position.distance_to(posicionDestino) / velocidad
	$Tween.interpolate_property(self, "position", position, posicionDestino, tiempo, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween.start()
	pass

func _on_Tween_tween_completed(object, key):
	# si es posicion 1
	if posicionDestino.x == posicion1.x && posicionDestino.y == posicion1.y: 
		posicionDestino = posicion2
	# si es posicion 2
	elif posicionDestino.x == posicion2.x && posicionDestino.y == posicion2.y:
		posicionDestino = posicion3
	elif posicionDestino.x == posicion3.x && posicionDestino.y == posicion3.y:
		posicionDestino = posicion4
	elif posicionDestino.x == posicion4.x && posicionDestino.y == posicion4.y:
		posicionDestino = posicion1
	mover()
	pass
