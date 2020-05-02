extends Node2D

var touched = false
const max_button_ration_length = 40
signal stick_motion

func _process(_delta):
	if touched == true:
		if Input.is_action_just_released("touch"):
			touched = false
		else:
			# clamp devuelve el mismo vector pero reducido para que su
			# distancia sea de max_button_ration_length o menos
			var new_position = get_local_mouse_position().clamped(max_button_ration_length)
			$ButtonImage.position = new_position
			# Emite una señal enviando la nueva posición ( clampeada ) para ser utilizada luego por el personaje
			emit_signal("stick_motion", new_position)
	elif $ButtonImage.position != $CenterPosition.position:
		# Si no esta presionado y el botón no está centrado, lo centra
		$ButtonImage.position = $CenterPosition.position
		# Emite la misma señal que antes pero con la posición 0,0
		emit_signal("stick_motion", $CenterPosition.position)
	

func _on_TouchArea_input_event( _viewport, event, _shape_idx ):
	if event.is_action_pressed("touch") && touched == false:
		touched = true
