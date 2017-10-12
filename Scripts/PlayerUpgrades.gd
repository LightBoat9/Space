# Keeps track of the players current upgrades and has functions for upgrading
extends "BaseNode2D.gd"

# Hold int constants of the upgrades
enum Upgrades { Engine, Fuel, Cargo, Health, Weapon }

var levels = [1, 1, 1, 1, 1] # Keeps track of the upgrade levels

# Upgrades the passed upgrade reference 
# either the name as a string or the constant
func upgrade(value):
	# Increase Level
	if (typeof(value) == TYPE_STRING):
		if (levels[Upgrades[str(value)]] < 10): levels[Upgrades[str(value)]] += 1
	elif (typeof(value) == TYPE_INT):
		if (levels[value] < 10): levels[value] += 1
	
	# Call the upgrade function in each upgrade object
	if (get_upgrade_ref(value) != null):get_upgrade_ref(value).upgrade()
	
# Returns the level of the passed in upgrade reference
func get_level(value):
	if (typeof(value) == TYPE_STRING):
		return levels[Upgrades[str(value)]]
	elif (typeof(value) == TYPE_INT):
		return levels[value]
	
# Returns a reference to the upgrade object based on index or string name
func get_upgrade_ref(value):
	value = str(value)
	if (value == "Engine" || value == "0"): return PlayerControl
	elif (value == "Fuel" || value == "1"): return PlayerFuel
	elif (value == "Cargo" || value == "3"): return Inventory
	elif (value == "Weapon" || value == "4"): return PlayerWeapon