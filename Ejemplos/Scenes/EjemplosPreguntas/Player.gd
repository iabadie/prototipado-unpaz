extends KinematicBody2D

var velocity = Vector2(20, 0)

func _physics_process(delta):
	if global_position.y < 400:
		velocity.y += 10
	if global_position.y > 400:
		position.y = 400
		velocity.y = 0
	if Input.is_action_just_pressed("ui_up"):
		velocity.y -= 400
	move_and_slide(velocity)
	pass

func _process(delta):
	if Input.is_action_just_pressed("touch"):
		print(get_global_mouse_position())
	pass
