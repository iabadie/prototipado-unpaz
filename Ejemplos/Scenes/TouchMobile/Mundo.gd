extends Node2D

var touched1 = false
var touched2 = false
var spriteRef

func _ready():
	spriteRef = $icon3
	pass

func _on_AreaIzquierda_input_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch && !touched1:
		$icon3.queue_free()
		touched1 = true
		$icon.visible = true
	pass

func _on_AreaDerecha_input_event(viewport, event, shape_idx):
	if event is InputEventScreenDrag:
		if checkIfExist():
			print("EXISTE")
		else:
			print("NO EXISTE")
		print(event.position)
		$icon2.visible = true
	pass

func checkIfExist():
	return get_tree().get_nodes_in_group("sprites").has(spriteRef)
