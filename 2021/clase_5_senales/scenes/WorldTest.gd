extends Node2D


func _ready():
	$Player.connect("win_message", self, "win_flag")
	$Player.connect("dying_time", self, "player_ready_to_die")
	pass

func win_flag(count):
	print(count)
	$LabelNode/Label.text = "GANASTE!\nRecolectaste " + String(count) + " estrellas"
	
	#         GANASTE!
	#  Recolectaste x estrellas
	
	$LabelNode/Label.visible = true
	pass


func player_ready_to_die():
	$Timer.start()
	pass


func _on_Timer_timeout():
	$Player.queue_free()
