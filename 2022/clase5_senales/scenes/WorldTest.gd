extends Node2D


func _ready():
	$Player.connect("bullet_shooted", $BulletsLabel, "bullet_shooted")
	$Player.connect("bullet_reload", $BulletsLabel, "bullet_reload")
	$BulletsLabel.connect("no_more_bullets", $Player, "no_more_bullets")

