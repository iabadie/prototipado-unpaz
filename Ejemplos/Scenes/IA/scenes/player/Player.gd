extends KinematicBody2D

var isMoving = false
var direction = Vector2.RIGHT

func _physics_process(delta):
	if not isMoving:
		if Input.is_action_pressed("ui_left"):
			direction = Vector2.LEFT
		if Input.is_action_pressed("ui_right"):
			direction = Vector2.RIGHT
		if Input.is_action_pressed("ui_up"):
			direction = Vector2.UP
		if Input.is_action_pressed("ui_down"):
			direction = Vector2.DOWN
		# Si puede moverse, se mueve o de otra forma, si no colisiona, se mueve
		# Realiza un test en la dirección seleccionada a una distancia de 32
		# La mitad de los 64 que corresponden al movimiento del personaje
		# Para garantizar que no sobrepasará al objetivo u obstáculo
		var hasColission = test_move(self.transform, direction * 32)
		if not hasColission:
			move()


func move():
	isMoving = true
	var distance = direction * 64
	$Tween.interpolate_property(self, "position", self.position, self.position + distance, 0.3,Tween.TRANS_LINEAR , Tween.EASE_IN_OUT)
	$Tween.start()


func _on_Tween_tween_completed(object, key):
	isMoving = false
