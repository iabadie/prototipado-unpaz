extends Node2D

## Variable exportada que usaremos como referencia para saber cuando debe desplarse 
## el auto para llegar de un carril a otro. Los valores se pueden editar en el inspector de
## Propiedades de la instancia
export var distanceBetweenPositions = 200

## Defino el máximo y mínimo de posiciones
# Esto sería mas simple usando otro tipo de estructuras de datos
# Cambiando estos valores se puede jugar con al cantidad de carriles
const MIN_POSITION = 1
const MAX_POSITION = 3

var actualPosition = 2 # Indica donde está actualmente el auto entre 1 y 3

# Variable para saber se está ejecutando un tween
var is_moving = false 

func _process(delta):
	## ejecuta movimiento solo si en el momento no se está
	## Realizando un movimiento
	if not is_moving:
		# Se mueve solo si la posición actual es mayor a la minima
		# Ejemplo, si estoy en carril 2 y el mínimo es 1, entonces
		# Se mueve hacia 1
		if Input.is_action_pressed("ui_left") and actualPosition > MIN_POSITION:
			actualPosition -= 1
			execute_move_animation("left")
		elif Input.is_action_pressed("ui_right") and actualPosition < MAX_POSITION:
			actualPosition += 1
			execute_move_animation("right")

# Función que interpola de posición inicial a final
func execute_move_animation(direction):
	is_moving = true
	var initialPosition = self.position
	# Posición final es igual a la inicial +/- la distancia que deba recorrer
	# Para alcanzar el siguiente carril
	var finalPosition = initialPosition
	# para este ejemplo solo se mueve horizontalmente, por eso solo se modifica
	# El valor x del vector position
	if direction == "left":
		finalPosition.x -= distanceBetweenPositions
	if direction == "right":
		finalPosition.x += distanceBetweenPositions
	
	$Tween.interpolate_property(self, "position", initialPosition, finalPosition, 1.0, Tween.TRANS_LINEAR,Tween.EASE_IN_OUT)
	$Tween.start()
	
	## Agregado extra solo para mostrar cambio de color cuando está realizando traslación
	$CarSprite.modulate = Color(0.5,1.0,0.5, 0.8)


func _on_Tween_tween_completed(object, key):
	# Si la animación que terminó es la de position entonces
	# cambio variable a fasle para indicar al script que ya no se mueve
	# Aclaración,  el nombre de la propiedad inicia con dos puntos
	# En caso de no recordarlo basta con hacer un print del key
	if key == ":position":
		is_moving = false
		$CarSprite.modulate = Color(1.0,1.0,1.0, 1.0)
