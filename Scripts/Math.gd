# A class for Math related functions not already implemented
extends Node

# Create a vector from an angle
func angle_to_vector(angle):
	return Vector2(cos(angle), -sin(angle))

# Randomly choose one of the two parameters	
func choose(a, b):
	randomize()
	return conditional(rand_range(-1,1) > 0, a, b)

# If the condition is true return the first parameter
# Otherwise return the second parameter
func conditional(condition, a, b):
	if (condition): return a
	return b

# Return the distance from vector a to vector b
func distance_to_point(a, b):
	return sqrt(pow(a.x - b.x, 2) + pow(a.y - b.y, 2))


