extends Sprite


func remove_all():
	queue_free();

func _on_Area_area_entered(area):
	queue_free()
