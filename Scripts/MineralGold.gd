extends "BaseNode2D.gd"

# Mineral Nodes
onready var GoldArea = get_node("GoldArea")

var collected = false
var rotation = 0
var rotation_speed = 0

func init(rotation_speed):
	self.rotation_speed = rotation_speed

func _ready():
	add_to_group("Gold")
	GoldArea.connect("body_enter", self, "_player_enter")
	
	set_process(true)

func _process(delta):
	rotation += rotation_speed
	set_rot(rotation)
	out_of_range()
	
func _player_enter(body):
	if (!body.is_in_group("Player")): return
	if (collected): return
	
	if (Inventory.add_item("Gold")):
		collected = true
		_destroy()
		
func out_of_range():
	if (distance_to_player() > 512):
		_destroy()
		
func distance_to_player():
	return Math.distance_to_point(get_pos(), Player.get_pos())
	
func _destroy():
	queue_free()