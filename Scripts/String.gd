extends Node2D

var Character = preload("res://Scenes/Character.tscn")

var width = 11
var space = 4

var string = ""
var character_scale = Vector2(1,1)
	
func set_string(value):
	string = value
	
	for i in get_children():
		i.queue_free()
	
	var counter = 0
	for i in string:
		var inst = Character.instance()
		inst.set_pos(Vector2(((width + space) * counter),0))
		inst.set_character(i)
		inst.set_scale(character_scale)
		add_child(inst)
		counter += 1

func get_string():
	return string
	
func set_scale(value):
	character_scale = value