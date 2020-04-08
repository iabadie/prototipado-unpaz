extends KinematicBody2D

const SPEED = 300
var velocity = Vector2()
var items_count = 0
signal win_condition

func _ready():
	$Score.text = "Items: " + String(items_count)
	pass

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
	items_count += 1
	$Score.text = "Items: " + String(items_count)
	if items_count == 3:
		emit_signal("win_condition")
		get_tree().call_group("items_group", "group_items_free")
	pass

