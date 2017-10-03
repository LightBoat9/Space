extends Node

func _ready():
	pass

func choose(a, b):
	randomize()
	var r = rand_range(-1,1)
	if (r > 0): return a
	return b

func angle2vector(angle):
	return Vector2(cos(angle), -sin(angle))