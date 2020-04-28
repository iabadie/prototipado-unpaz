extends Sprite

var initialPosition

func _ready():
	initialPosition = true
	# Llama a la función interpolate_position
	interpolate_position()
	pass


func _on_Tween_tween_completed(object, key):
	initialPosition = !initialPosition
	interpolate_position()
	pass

# Esta función calcula la interpolación de la propiedad de un nodo
# y ejecuta una transformación de dicha propiedad, en el tiempo.
func interpolate_position():
	if initialPosition:
		$Tween.interpolate_property(self, "position", self.position, self.position + Vector2(700, 400), 1.5,Tween.TRANS_ELASTIC,Tween.EASE_OUT)
	else:
		$Tween.interpolate_property(self, "position", self.position, self.position + Vector2(-700, -400), 3,Tween.TRANS_CUBIC,Tween.EASE_IN_OUT)
	$Tween.start()
	# https://docs.godotengine.org/en/3.2/classes/class_tween.html