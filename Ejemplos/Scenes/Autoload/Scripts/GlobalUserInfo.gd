extends Node

const min_lives = 0
const max_lives = 3 # Esta es la constantes de la cantidad máxima de vidas
var lives = max_lives  # Esta es la variable que indíca cuantas vidas tengo en cada momento.

func sub_lives():
	if lives > min_lives:
		lives -= 1
	pass
	
func add_lives():
	if lives < max_lives:
		lives += 1
	pass
