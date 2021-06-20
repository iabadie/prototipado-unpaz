extends KinematicBody2D


const SPEED = 300
var velocity = Vector2();
var isOnTeleport = false;

func _ready():
	$AnimatedSprite.play();
	
func _physics_process(delta):
	if not isOnTeleport:
		if Input.is_action_just_pressed("ui_left"):
			velocity  = Vector2(-SPEED, 0);
			$AnimatedSprite.flip_h = false;
		elif Input.is_action_just_pressed("ui_right"):
			velocity  = Vector2(SPEED, 0);
			$AnimatedSprite.flip_h = true;
		elif Input.is_action_just_pressed("ui_up"):
			velocity  = Vector2(0, -SPEED);
		elif Input.is_action_just_pressed("ui_down"):
			velocity  = Vector2(0, SPEED);
	move_and_slide(velocity);

func portal_taken(direction: Vector2, teleportPosition: Vector2):
	isOnTeleport = true;
	global_position = teleportPosition
	velocity = direction * SPEED;

func exiting_from_portal():
	isOnTeleport = false;

	
