extends Node2D




func _on_AreaResorte_body_entered(body):
	$Salidas.visible = true


func _on_AreaResorte_body_exited(body):
	$Salidas.visible = false
