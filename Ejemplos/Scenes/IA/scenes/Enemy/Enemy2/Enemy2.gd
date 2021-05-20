extends KinematicBody2D

const SPEED = 100
var isMoving = false
var direction = Vector2.RIGHT

func _ready():
	randomize()

func _physics_process(delta):
	if not isMoving:
		var randDirectionNumber = floor(rand_range(0, 4))
		if randDirectionNumber == 0:
			direction = Vector2.LEFT
		if randDirectionNumber == 1:
			direction = Vector2.RIGHT
		if randDirectionNumber == 2:
			direction = Vector2.UP
		if randDirectionNumber == 3:
			direction = Vector2.DOWN
		isMoving = true
		$Timer.start()
		
	move()


func move():
	move_and_slide(direction * SPEED)


func _on_Timer_timeout():
	isMoving = false


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	pass
