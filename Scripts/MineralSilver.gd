extends KinematicBody2D

onready var SilverArea = get_node("SilverArea")
onready var Inventory = get_parent().get_node("GUI/Inventory")

var collected = false

func _ready():
	add_to_group("Silver")
	SilverArea.connect("body_enter", self, "_player_enter")

func _player_enter(body):
	if (!body.is_in_group("Player")): return
	if (collected): return
	
	if (Inventory.add_item("Silver")):
		collected = true
		_destroy()
	
func _destroy():
	queue_free()
	
	
