extends Node2D

var texture_array = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", 
					"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", 
					"n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
var texture_index = 0
var texture = null
	
func set_character(value):
	texture_index = texture_array.find(value)
	if (texture_index != -1):
		var texture = load("res://Textures/gui/font/" + str(texture_index) + ".png")
		get_child(0).set_texture(texture)
	else:
		get_child(0).set_texture(null)