# The base node of the Player Ship
extends "BaseNode2D.gd"

var at_base = false setget set_at_base, get_at_base
var at_base_distance = 50 # How close the player must be to bet "at_base"
var in_menu = false setget set_in_menu, get_in_menu
	
func _ready():
	add_to_group("Player")
	
	set_process_input(true)
	set_process(true)
	
func _input(event):
	var dist_to_base = Math.distance_to_point(get_pos(), Base.get_pos())
	set_at_base(dist_to_base < at_base_distance)
	if (!in_menu && at_base && event.is_action_pressed("key_shoot")):
		set_in_menu(true)
	
func set_at_base(value):
	at_base = value
	
func get_at_base():
	return at_base
	
func set_in_menu(value):
	in_menu = value
	
	# Also toggle the ability to move or rotate
	PlayerControl.set_process(!in_menu)
	
	BaseUpgrades.toggle_input()
	
func get_in_menu():
	return in_menu