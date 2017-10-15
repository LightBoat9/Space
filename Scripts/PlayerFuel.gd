# Information about the players fuel supply and methods for 
# using, refilling, and upgrading fuel
extends "BaseNode2D.gd"

var fuel = 1 setget , get_fuel
var max_fuel = 1
var burn_rate = 0.001 

# Decrease the the fuel by the burn_rate and update the Fuel GUI
func use_fuel():
	if (fuel > 0): fuel -= burn_rate
	else: fuel = 0
	update_fuel_gui()

func refuel():
	fuel = max_fuel
	update_fuel_gui()

# Scale the fuel gui by the ratio of fuel left
func update_fuel_gui():
	var rec = Rect2(Vector2(0,0), Vector2(16,48 * get_fuel_ratio()))
	FuelFill.set_region_rect(rec)
	FuelFill.set_pos(Vector2(0,-48 * get_fuel_ratio() + 48)) # Correct the GUI position
	
func get_fuel():
	return fuel
	
func get_fuel_ratio():
	return fuel/max_fuel

func upgrade():
	max_fuel = PlayerUpgrades.get_level("Fuel")
	fuel = max_fuel