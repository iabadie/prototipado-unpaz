extends Node2D

func group_items_free():
	queue_free()
	pass

func _on_Area_area_entered(area):
	queue_free()
	pass
