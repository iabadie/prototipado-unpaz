extends KinematicBody2D

var velocity = Vector2(0,0)

func _ready():
	
	pass

func _physics_process(delta):
	velocity.y += 50
	if is_on_floor():
		velocity.y = 0
	if Input.is_action_just_pressed("ui_up"):
		velocity.y = -800
	if Input.is_action_pressed("ui_left"):
		$Animation.play("run")
		velocity.x = -300
		$Animation.flip_h = true
	if Input.is_action_pressed("ui_right"):
		$Animation.play("run")
		velocity.x = 300
		$Animation.flip_h = false
	if Input.is_action_just_released("ui_left") || Input.is_action_just_released("ui_right"):
		$Animation.stop()
		$Animation.frame = 1
		velocity.x = 0
	move_and_slide(velocity, Vector2(0, -1))
	pass

func _on_Area_area_entered(area):
	if area.name == "AreaEnemigo":
		queue_free()
	pass
