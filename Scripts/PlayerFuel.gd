extends Node

# Player Nodes
onready var PlayerControl = get_parent().get_node("PlayerControl")

# Other Nodes
onready var FuelGUI = get_parent().get_parent().get_node("GUI/Fuel/Fill")

var fuel = 1 setget set_fuel, get_fuel
var MaxFuel = 1
var burn_rate = 0.001 setget set_burn_rate, get_burn_rate

func _ready():
	pass

# Decrease the the fuel by the burn_rate and update the FuelGUI
func use_fuel():
	if (fuel > 0): fuel -= burn_rate
	else: fuel = 0
	update_fuel_gui()
	
func set_fuel(value):
	fuel = value
	update_fuel_gui()

func refuel():
	fuel = MaxFuel
	update_fuel_gui()

# Scale the fuel gui by the ratio of fuel left
func update_fuel_gui():
	var rec = Rect2(Vector2(0,0), Vector2(16,48 * get_fuel_ratio()))
	FuelGUI.set_region_rect(rec)
	FuelGUI.set_pos(Vector2(0,-48 * get_fuel_ratio() + 48)) # Correct the GUI position
	
func get_fuel():
	return fuel
	
func get_fuel_ratio():
	return fuel/MaxFuel

func set_burn_rate(value):
	burn_rate = value
	
func get_burn_rate():
	return burn_rate