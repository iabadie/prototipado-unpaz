extends Button

# Variable importada desde el inspector
export(String, FILE, "*.tscn") var scene

func _on_MenuButton_button_down():
	if scene != null:
		# ejecuta "load_scene" pasandole el parametro "scene"
		get_tree().call_group("load_scene", "load_scene", scene)
	pass
