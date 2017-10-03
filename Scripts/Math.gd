extends Node

func angle_to_vector(angle):
	return Vector2(cos(angle), -sin(angle))
	
func choose(a, b):
	randomize()
	return conditional(rand_range(-1,1) > 0, a, b)

func conditional(condition, a, b):
	if (condition): return a
	return b

func distance_to_point(a, b):
	return sqrt(pow(a.x - b.x, 2) + pow(a.y - b.y, 2))


