extends Control


onready var powerUps = $Panel/CenterContainer/PowerUps

var powerUpScene = preload("res://Scenes/UIControl/PowerUp.tscn")

func _on_Button_button_down():
	var powerUp = powerUpScene.instance()
	$Panel/CenterContainer/PowerUps.add_child(powerUp)
	pass

func _on_Button2_button_down():
	borrar_ultimo_nodo()
	pass

func borrar_ultimo_nodo():
	var cantidadElementos = powerUps.get_child_count()
	if cantidadElementos > 0:
		powerUps.get_child(cantidadElementos - 1).queue_free()
	pass


func _on_Button3_button_down():
	borrar_todos()
	pass

func borrar_todos():
	for items in powerUps.get_children():
		items.queue_free()
	pass
