extends Label

signal no_more_bullets

const bulletsText = "Balas disponibles: "
var bullets = 10;


func _ready():
	display()


func display():
	text = bulletsText + String(bullets)

func bullet_shooted():
	bullets -= 1
	display()
	if bullets <= 0:
		emit_signal("no_more_bullets")

func bullet_reload():
	bullets += 1
	display()
