extends Button

export (String) var buttonTitle
export (int) var cantidad
export (String, "uno", "dos", "tres") var numeros

func _ready():
	text = buttonTitle + String(cantidad)
	pass

