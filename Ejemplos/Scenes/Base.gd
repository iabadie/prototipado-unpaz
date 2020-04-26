extends VBoxContainer

var menuScene = preload("res://Scenes/Menu/Menu.tscn")
var menuInstance
var sceneInstance

func _ready():
	$Back.visible = false
	menuInstance = $Menu
	pass

func load_scene(scene: String):
	# Quita el menu y agrega la escena elegida
	remove_child(menuInstance)
	menuInstance = null
	sceneInstance = load(scene).instance()
	add_child(sceneInstance)
	$Back.visible = true
	pass

func _on_Back_button_down():
	remove_child(sceneInstance)
	sceneInstance = null
	$Back.visible = false
	instance_menu()
	pass

func instance_menu():
	menuInstance = menuScene.instance()
	add_child(menuInstance)
	pass
