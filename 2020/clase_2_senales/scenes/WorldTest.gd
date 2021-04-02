extends Node2D

var winTitle = preload("res://scenes/UI/WinLabel.tscn")

func _ready():
	var winTitleInstance = winTitle.instance()
	add_child(winTitleInstance)
	$Player.connect("win_condition", winTitleInstance, "show_win")
	pass
