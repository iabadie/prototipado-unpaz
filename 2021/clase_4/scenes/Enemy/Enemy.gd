extends KinematicBody2D

const VELOCITY = Vector2(-100, 0)

func _physics_process(delta):
	move_and_slide(VELOCITY)


func _on_Area2D_body_entered(body):
	body.queue_free()
	pass
