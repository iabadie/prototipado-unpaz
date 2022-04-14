extends KinematicBody2D

var BulletResource = preload("res://scenes/Bullet/Bullet.tscn")

signal bullet_reload
signal bullet_shooted

const SPEED = 500
var velocity = Vector2()
var can_shoot = true;

func _input(event):
	if can_shoot and Input.is_action_just_pressed("ui_accept"):
		shootBullet()


func _physics_process(delta):
	if Input.is_action_just_released("ui_left") or Input.is_action_just_released("ui_right"):
		velocity.x = 0
		velocity.y = 0
	if Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
	if Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
	move_and_slide(velocity)

func shootBullet():
	emit_signal("bullet_shooted")
	## Con .instance creamos una instancia de el recurso Bullet.
	var bulletInstance = BulletResource.instance()
	# Agregamos la instancia al parent
	get_parent().add_child(bulletInstance)
	# Asignamos la posición global a la bala
	bulletInstance.global_position = $BulletSpot.global_position
	bulletInstance.connect("bullet_destroyed", self, "bullet_reload")

func no_more_bullets():
	can_shoot = false

func bullet_reload():
	emit_signal("bullet_reload")
	can_shoot = true;
