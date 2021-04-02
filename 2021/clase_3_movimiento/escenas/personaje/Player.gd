extends KinematicBody2D


var velocity = Vector2(0,0);
var gravity = 0;

func _ready():
	pass

func _physics_process(delta):
	gravity += 10;
	if gravity > 400:
		gravity = 400;
	if Input.is_action_just_pressed("ui_up"):
		gravity = -400
	if Input.is_action_just_pressed("ui_left"):
		velocity.x = -200;
	if Input.is_action_just_pressed("ui_right"):
		velocity.x = 200;
	velocity.y = gravity
	print(gravity);
	move_and_slide(velocity);
	pass
	
