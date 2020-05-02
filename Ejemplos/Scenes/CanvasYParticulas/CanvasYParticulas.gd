extends CanvasLayer

func _on_SimularEvento_timeout():
	$Tween.interpolate_property($ProgressBar,"value", $ProgressBar.value, $ProgressBar.value - 5, 0.5,Tween.TRANS_LINEAR,Tween.EASE_IN)
	$Tween.start()
	pass
