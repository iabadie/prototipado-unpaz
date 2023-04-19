extends Node2D



func eliminar():
	Sistema.POINTS += 1
	queue_free()
	
	
	

func _on_Area2D_area_entered(area):
	eliminar()
	pass


func _on_Area2D_body_entered(body):
	eliminar()
	pass
