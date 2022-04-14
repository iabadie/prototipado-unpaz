extends KinematicBody2D

const NORMAL = Vector2.UP;
const VELOCITY_STEP = 50;
const GRAVITY = 10;
const MAX_VEL = 500;
var velocity = Vector2();
var is_jumping = false;

func _ready():
	pass

func _physics_process(delta):
	if is_on_floor() and is_jumping:
		$AnimatedSprite.play("idle")
		velocity.y = 0;
		is_jumping = false
	if not is_on_floor():
		velocity.y += GRAVITY

	if Input.is_action_just_released("ui_left") or Input.is_action_just_released("ui_right"):
		velocity.x = 0
		$AnimatedSprite.play("idle")
	if Input.is_action_pressed("ui_right") and velocity.x < MAX_VEL:
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("run")
		velocity.x += VELOCITY_STEP
	if Input.is_action_pressed("ui_left") and velocity.x > -MAX_VEL:
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("run")
		velocity.x -= VELOCITY_STEP
	if Input.is_action_just_pressed("ui_up") and not is_jumping:
		$AnimatedSprite.play("jump")
		is_jumping = true
		velocity.y -= 500;
	move_and_slide(velocity, NORMAL)
	pass


func _on_Area_area_entered(area):
	print("ENTRO AL AREA")
	if area.name == "AreaEnemy":
		queue_free()
	else:
		print("EL AREA ES EL COLECCIONABLE")
		get_tree().call_group("puntaje", "aumentar_puntaje", 999)
	pass
