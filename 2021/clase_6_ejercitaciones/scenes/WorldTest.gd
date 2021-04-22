extends Node2D

var escenaItem = preload("res://scenes/Item/Item.tscn")
var escenaTextoPuntos = preload("res://scenes/PointsLabel/PointsLabel.tscn")

func _ready():
	var textoDePuntos = escenaTextoPuntos.instance()
	add_child(textoDePuntos)
	
	var item = escenaItem.instance() # Crea la instancia
	item.configurar_posicion(Vector2(100, 200))
	add_child(item)
	
	var item2 = escenaItem.instance() # Crea la instancia
	item2.configurar_posicion(Vector2(700, 200))
	add_child(item2)

	var item3 = escenaItem.instance() # Crea la instancia
	item3.configurar_posicion(Vector2(100, 400))
	add_child(item3)
	pass


