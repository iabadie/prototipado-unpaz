extends StaticBody2D

var spriteResource = preload("res://assets/pisos/piso.png")

export var speed = 10
export (StreamTexture) var spriteToUse = spriteResource
export(String, "Vertical", "Horizontal") var direccion = "Vertical"
export(float, 0, 1, 0.1) var opacidad = 1
export(Color, RGB) var color = Color(1,1,1,1)

func _ready():
	$Sprite.modulate = Color(color.r, color.g, color.b, opacidad)
	$Sprite.texture = spriteToUse

func _process(delta):
	if direccion == "Vertical":
		position.y -= speed
	else:
		position.x -= speed
	pass
