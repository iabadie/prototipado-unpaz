extends ParallaxBackground

# Este código "simula" que hay movimiento, cuando en realidad
# La cámara no se está moviendo.

const desplazamiento = 8 # Potencias de 2 es conveniente
const screen_x_size = 1024

func _ready():
	# Esto crea una copia espejo de la imagen y lo desplaza
	# El tamaño de mi pantalla.
	# Se puede settear directamente del inspector.
	$ParallaxLayer.motion_mirroring.x = screen_x_size

func _process(delta):
	# Si la imagen se desplazó completamente (1 pantalla de distancia)
	# devuelve el offset a 0
	if scroll_offset.x - desplazamiento < -screen_x_size:
		scroll_offset.x = 0
	else:
		scroll_offset.x -= desplazamiento
	pass
