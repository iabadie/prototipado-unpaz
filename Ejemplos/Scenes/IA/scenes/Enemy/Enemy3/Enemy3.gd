extends KinematicBody2D

var isMoving = false
var direction = Vector2.RIGHT

var listaMovimientos = [1, 1 , 2, 2, 0, 0, 3, 3]
var indiceMovimiento = 0

func _ready():
	randomize()
	pass

func _physics_process(delta):
	if not isMoving:
		var randDirectionNumber = listaMovimientos[indiceMovimiento]
		if randDirectionNumber == 0:
			direction = Vector2.LEFT
		if randDirectionNumber == 1:
			direction = Vector2.RIGHT
		if randDirectionNumber == 2:
			direction = Vector2.UP
		if randDirectionNumber == 3:
			direction = Vector2.DOWN
		# Si puede moverse, se mueve o de otra forma, si no colisiona, se mueve
		# Realiza un test en la dirección seleccionada a una distancia de 32
		# La mitad de los 64 que corresponden al movimiento del personaje
		# Para garantizar que no sobrepasará al objetivo u obstáculo
		var hasColission = test_move(self.transform, direction * 32)
		if not hasColission:
			move()
		indiceMovimiento += 1
		if listaMovimientos.size() == indiceMovimiento:
			indiceMovimiento = 0


func move():
	isMoving = true
	var distance = direction * 64
	$Tween.interpolate_property(self, "position", self.position, self.position + distance, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween.start()


func _on_Tween_tween_completed(object, key):
	isMoving = false
