extends "BaseNode2D.gd"

enum Upgrades { Engine, Fuel, Cargo, Health, Weapon }

var levels = [1, 1, 1, 1, 1]

func upgrade(value):
	if (typeof(value) == TYPE_STRING):
		if (levels[Upgrades[str(value)]] < 10): levels[Upgrades[str(value)]] += 1
	elif (typeof(value) == TYPE_INT):
		if (levels[value] < 10): levels[value] += 1
		
	if (typeof(value) == TYPE_STRING):
		if (value == "Engine"):
			PlayerControl.upgrade()
		elif (value == "Fuel"):
			PlayerFuel.upgrade()
		elif (value == "Cargo"):
			Inventory.add_slot()
		elif (value == "Weapon"):
			PlayerWeapon.upgrade()
			
	elif (typeof(value) == TYPE_INT):
		if (value == 0):
			PlayerControl.upgrade()
		elif (value == 1):
			PlayerFuel.upgrade()
		elif (value == 3):
			Inventory.add_slot()
		elif (value == 4):
			PlayerWeapon.upgrade()
		
func get_level(value):
	if (typeof(value) == TYPE_STRING):
		return levels[Upgrades[str(value)]]
	elif (typeof(value) == TYPE_INT):
		return levels[value]