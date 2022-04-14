extends Node2D

const POINTS_VALUE = 10

func _process(delta):
	position.y += 5;


func _on_Area2D_area_entered(area):
	if area.name == "AreaBullet":
		get_tree().call_group("points", "add_points", POINTS_VALUE)
		queue_free()
