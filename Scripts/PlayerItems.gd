extends Node

onready var Player = get_parent()
onready var Base = get_parent().get_parent().get_node("Base")
onready var Inventory = get_parent().get_parent().get_node("GUI/Inventory")
onready var Math = get_parent().get_parent().get_node("Math")

func _ready():
	set_process(true)
	
func _process(delta):
	var at_base = Math.distance_to_point(Player.get_pos(), Base.get_pos()) < 100
	if (at_base):
		Inventory.sell_items()
