extends Panel

export (String) var instructions = ""

func _ready():
	visible = true
	$CenterContainer/Text.text = instructions
	pass

func _on_Button_button_down():
	queue_free()
	pass
