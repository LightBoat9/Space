extends Node

var fuel = 1
var burn_rate = 0.001
var max_fuel = 1

onready var PlayerControl = get_parent().get_node("PlayerControl")
onready var FuelGUI = get_parent().get_parent().get_node("GUI/Fuel/Fill")

func _ready():
	pass
	
func use_fuel():
	if (fuel > 0): fuel -= burn_rate
	elif (fuel != -1): 
		PlayerControl.start_out_of_fuel_angle()
		fuel = -1
	else: fuel = -1
	
	var rec = Rect2(Vector2(0,0), Vector2(16,48 * get_fuel_ratio()))
	print(48 * get_fuel_ratio())
	FuelGUI.set_region_rect(rec)
	FuelGUI.set_pos(Vector2(0,-48 * get_fuel_ratio() + 48))

func get_fuel():
	return fuel
	
func get_fuel_ratio():
	return fuel/max_fuel
