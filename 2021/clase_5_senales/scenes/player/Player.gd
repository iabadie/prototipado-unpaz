extends KinematicBody2D

# Señales
signal win_message
signal dying_time

# Constantes
const MAX_STARTS_RECOLECTED = 1
const SPEED = 300

# Variables
var velocity = Vector2()
var count = 0;


func _physics_process(delta):
	if Input.is_action_just_released("ui_down") or Input.is_action_just_released("ui_up") or Input.is_action_just_released("ui_left") or Input.is_action_just_released("ui_right"):
		velocity.x = 0
		velocity.y = 0
	if Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
	if Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
	if Input.is_action_pressed("ui_up"):
		velocity.y = -SPEED
	if Input.is_action_pressed("ui_down"):
		velocity.y = SPEED
	move_and_slide(velocity)
	pass


func _on_Area_area_entered(area):
	count += 1
	$Count.text = "Contador: " + String(count)
	if count == MAX_STARTS_RECOLECTED:
		get_tree().call_group("estrellas", "remove_all")
		emit_signal("win_message", count)
		emit_signal("dying_time")
	pass
