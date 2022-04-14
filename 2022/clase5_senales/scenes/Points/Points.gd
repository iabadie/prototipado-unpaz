extends Label

const pointsText = "PUNTOS: "
var points = 0;

func _ready():
	display()

func add_points(newPoints):
	points += newPoints
	display()

func display():
	text = pointsText + String(points)
