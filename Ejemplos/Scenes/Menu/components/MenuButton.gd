extends Button

# Variable importada desde el inspector
export(String, FILE, "*.tscn") var scene

func _on_MenuButton_button_down():
	if scene != null:
		get_tree().change_scene(scene)
	pass
