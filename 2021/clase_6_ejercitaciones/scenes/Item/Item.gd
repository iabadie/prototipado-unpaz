extends Area2D


func _on_Item_body_entered(body):
	queue_free()
	pass

func configurar_posicion(nuevaPosicion):
	position = nuevaPosicion
