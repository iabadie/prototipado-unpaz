extends Node2D



func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		
			$AnimationPlayer.play("rombo")
		
	pass
