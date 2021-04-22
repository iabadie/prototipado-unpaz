extends KinematicBody2D

const SPEED = 300
var velocity = Vector2()


func _physics_process(delta):
	if Input.is_action_just_pressed("ui_left"):
		velocity.x = -SPEED
	if Input.is_action_just_pressed("ui_right"):
		velocity.x = SPEED
	if Input.is_action_just_pressed("ui_up"):
		velocity.y = -SPEED
	if Input.is_action_just_pressed("ui_down"):
		velocity.y = SPEED
	var colision = move_and_collide(velocity * delta)
	if colision:
		velocity = colision.normal * SPEED
	pass


func _on_Area_area_entered(area):
	get_tree().call_group("puntaje", "sumar", 200)
	pass
