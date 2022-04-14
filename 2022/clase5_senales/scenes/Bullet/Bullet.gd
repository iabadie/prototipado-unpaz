extends Node2D

signal bullet_destroyed

func _process(delta):
	position.y -= 5;


func _on_AreaBullet_area_entered(area):
	if area.name == "AreaBomb":
		emit_signal("bullet_destroyed")
		queue_free()
