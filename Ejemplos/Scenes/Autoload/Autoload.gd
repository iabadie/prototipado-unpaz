extends Node2D

func _ready():
	$Vidas.text = "Vidas: " + String(GlobalUserInfo.lives)
	pass

func _on_DownLives_button_down():
	GlobalUserInfo.sub_lives()
	$Vidas.text = "Vidas: " + String(GlobalUserInfo.lives)
	pass

func _on_UpLives_button_down():
	GlobalUserInfo.add_lives()
	$Vidas.text = "Vidas: " + String(GlobalUserInfo.lives)
	pass

func _on_Button_button_down():
	get_tree().change_scene("res://Scenes/Autoload/Pantalla2.tscn")
	pass
