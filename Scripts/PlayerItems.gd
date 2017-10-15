# Sells items when near base
extends "BaseNode2D.gd"

func _ready():
	set_process(true)
	
func _process(delta):
	var at_base = Math.distance_to_point(Player.get_pos(), Base.get_pos()) < 100
	if (at_base):
		Inventory.sell_items()
