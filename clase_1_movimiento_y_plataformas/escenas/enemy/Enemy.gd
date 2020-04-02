extends KinematicBody2D

const velocity = Vector2(-50, 0)

func _physics_process(delta):
	move_and_slide(velocity)
	pass
