extends Node2D

var bullet = preload("res://Scenes/Layers/Bullet/Bullet.tscn")

func _on_AreaDetect_area_entered(area):
	print("COLISION DETECTADA")
	pass

func _on_AreaNoDetect_area_entered(area):
	print("COLISION NO DETECTADA, AUNQUE NUNCA SE VA A LLAMAR ESTE MÉTODO")
	pass

func generate_bullet(pos):
	var bulletInstance = bullet.instance()
	bulletInstance.position = pos
	add_child(bulletInstance)
	pass

func _on_BulletDetect_button_down():
	generate_bullet($PosDetect.position)
	pass

func _on_BulletNoDetect_button_down():
	generate_bullet($PosNoDetect.position)
	pass
