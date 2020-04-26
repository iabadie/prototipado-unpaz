extends KinematicBody2D

const velocity = Vector2(-400, 0)

func _physics_process(delta):
	move_and_slide(velocity)
	pass


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	pass
