extends Label

func _ready():
	text = "Vidas: " + String(GlobalUserInfo.lives)
	pass

