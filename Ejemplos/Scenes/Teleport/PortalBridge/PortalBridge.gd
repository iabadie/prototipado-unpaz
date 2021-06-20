extends Node2D

# NOTA: Click derecho sobre la instancia creada de esta escena, en el arbol de nodos
# Luego selecciono "hijos editables" y la instancia pasa a mostrar sus elementos internos, así se pueden
# Acomodar a gusto las areas


# NOTA 2: Luego a esta escena de protal, se le puede agregar una animación y Sprites si se quiere
# Que el portal sea visible, total los eventos de entrada y salida ya son
# Campurados

export (String, "Left", "Right", "Up", "Down") var firstPortalAppearDirection = "Right"
export (String, "Left", "Right", "Up", "Down") var secondPortalAppearDirection = "Left"

var firstPortalDirection
var secondPortalDirection
var isUsingPortal = false
var takenPortal = ""

func _ready():
	firstPortalDirection = mapDirectionToVector(firstPortalAppearDirection);
	secondPortalDirection = mapDirectionToVector(secondPortalAppearDirection);

func _process(delta):
	#print(isUsingPortal)
	pass

func mapDirectionToVector(dir):
	match dir:
		"Left":
			return Vector2.LEFT
		"Right":
			return Vector2.RIGHT
		"Up":
			return Vector2.UP
		"Down":
			return Vector2.DOWN
		_:
			return Vector2.LEFT
	
# Indica en que posición aparece y hacia que dirección debe aparecer
func on_enter_on_portal(appearDirection, toPortalPosition: Vector2):
	isUsingPortal = true;	
	get_tree().call_group("portals", "portal_taken", appearDirection, toPortalPosition)

func on_exit_from_portal():
	isUsingPortal = false;
	takenPortal = ""
	get_tree().call_group("portals", "exiting_from_portal")

func _on_FirstArea_area_entered(area):
	if isUsingPortal:
		return;
	takenPortal = "first"
	on_enter_on_portal(secondPortalDirection, $SecondArea.global_position);

func _on_SecondArea_area_entered(area):
	if isUsingPortal:
		return;
	takenPortal = "second"
	on_enter_on_portal(firstPortalDirection, $FirstArea.global_position);

func _on_FirstExitArea_area_exited(area):
	if isUsingPortal and takenPortal == "second":
		on_exit_from_portal()

func _on_SecondExitArea_area_exited(area):
	if isUsingPortal and takenPortal == "first":
		on_exit_from_portal();

