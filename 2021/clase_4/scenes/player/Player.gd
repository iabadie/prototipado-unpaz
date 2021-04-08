extends KinematicBody2D

const VECTOR_NORMAL = Vector2(0, -1)
const GRAVITY = 10
const SPEED = 300
var velocity = Vector2()
var esta_en_el_aire = false

var contador_estrellas = 0

func _physics_process(delta):
	if is_on_floor():
		velocity.y = 0
		esta_en_el_aire = false;
	else:
		velocity.y += GRAVITY
	if Input.is_action_just_released("ui_left") or Input.is_action_just_released("ui_right"):
		velocity.x = 0
		if not esta_en_el_aire:
			$Animation.play("quieto")
	if Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
		if not esta_en_el_aire:
			$Animation.play("caminar")
		$Animation.flip_h = true
	if Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
		if not esta_en_el_aire:
			$Animation.play("caminar")
		$Animation.flip_h = false
	if Input.is_action_pressed("ui_up") and not esta_en_el_aire:
		velocity.y = -SPEED * 2
		$Animation.play("saltar")
		esta_en_el_aire = true;
	move_and_slide(velocity, VECTOR_NORMAL)
	pass


func _on_Area2D_area_entered(area):
	contador_estrellas += 1
	if contador_estrellas >= 3:
		get_tree().call_group("items_recolectables", "eliminar")
	pass
