extends Control
onready var powerUps = $VBoxContainer/PowerUps
var powerUpScenes = preload("res://Scenes/UIControl/PowerUp.tscn")

func _on_Button_button_down():
	var powerUp = powerUpScenes.instance()
	$VBoxContainer/PowerUps.add_child(powerUp)
	pass

func _on_Button2_button_down():
	borrar_ultimo_nodo()
	pass

func _on_Button3_button_down():
	borrar_todos()
	pass

func borrar_ultimo_nodo():
	# Obtiene la cantidad de nodos hijos del contenedor PowerUps
	var cantidadElementos = powerUps.get_child_count()
	if cantidadElementos > 0:
		# Obtiene el nodo ubicado en la posición elementos - 1
		# Recordando que las posiciones en un listado se cuentan desde el indice cero 
		powerUps.get_child(cantidadElementos - 1).queue_free()
	pass
	
func borrar_todos():
	# Bucle que recorre la lista de nodos y por cada nodo que encuentra lo libera
	for items in powerUps.get_children(): # Para cada Item del listado de hijos
		items.queue_free()   # Hace esto
	pass
