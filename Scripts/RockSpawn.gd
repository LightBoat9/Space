# A class for spawning in rocks and enemies based on the distance the player
# is from the base
extends "BaseNode2D.gd"

var RockSmall = load("res://Scenes/RockSmall.tscn")

# Screen Variables
onready var screen_size = get_parent().get_viewport_rect().size
onready var w = screen_size.x
onready var h = screen_size.y
onready var mid_point = Vector2(w, h)

# Level
const LevelIncreaseDistance = 100
var level = 0

# Rocks
var rock_amount = 0
var max_rock_amount = 0

func _ready():
	set_process(true)
	
func _process(delta):
	update_max_rock_amount()
	spawn()
	
# Increases/ Decreases the amount of rocks that will spawn
# based on the distance from the center base
func update_max_rock_amount():
	var dist_from_base = Math.distance_to_point(Player.get_pos(), Base.get_pos())
	level = int(dist_from_base / LevelIncreaseDistance)
	max_rock_amount = level
	
# Spawn an assortment of rocks, enemies, etc based 
# on distance from the center base
func spawn():
	while (rock_amount < max_rock_amount):
		spawn_small_rock()
		rock_amount += 1
	
# Spawn a small rock randomly right outside of the camera view
func spawn_small_rock():
	randomize()
	var rand_x_pos
	var rand_y_pos
	
	# Generate the random spawn position
	# Choose to either spawn at the above/below player view or beside the view
	if (Math.choose(0,1)):
		rand_x_pos = Player.get_pos().x + (rand_range(w/2, w) * Math.choose(-1,1))
		rand_y_pos = Player.get_pos().y + rand_range(-h/2, h/2)
	else:
		rand_x_pos = Player.get_pos().x + rand_range(-w/2, w/2)
		rand_y_pos = Player.get_pos().y + (rand_range(h/2, h) * Math.choose(-1,1))
	
	# Instance the rock and set the position
	var inst = RockSmall.instance()
	inst.set_pos(Vector2(rand_x_pos, rand_y_pos))
	get_parent().call_deferred("add_child", inst)
	