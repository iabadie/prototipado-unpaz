extends Node2D

var touched = false
const max_ration_length = 40
signal get_motion

func _process(delta):
	if touched == true:
		if Input.is_action_just_released("touch"):
			touched = false
		else:
			# clamp devuelve el mismo vector pero reducido para que su
			# distancia sea de max_ration_length
			var new_position = get_local_mouse_position().clamped(max_ration_length)
			$boton.position = new_position
			# Emite una señal enviando la nueva posición ( clampeada ) para ser utilizada luego por el personaje
			emit_signal("get_motion", new_position)
	elif $boton.position != $center.position:
		# Si no esta presionado y el botón no está centrado, lo centra
		$boton.position = $center.position
		# Emite la misma señal que antes pero con la posición 0,0
		emit_signal("get_motion", $center.position)
	

func _on_touch_area_input_event( viewport, event, shape_idx ):
	if event.is_action_pressed("touch") && touched == false:
		touched = true
