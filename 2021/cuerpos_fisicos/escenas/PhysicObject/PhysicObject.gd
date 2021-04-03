extends RigidBody2D



func _physics_process(delta):
	if Input.is_action_just_pressed("ui_left"):
		apply_impulse(Vector2(), Vector2(150, -50));
	pass

func _integrate_forces(state):
	if Input.is_action_just_pressed("ui_accept"):
		state.transform = Transform2D(0, Vector2(80, 200));
		state.linear_velocity = Vector2(0,0);
		apply_impulse(Vector2(0, 0), Vector2(150, -100));
	pass
