extends Node2D

var player_cell = 0

onready var Math = get_parent().get_node("Math")

onready var Game = get_parent()
onready var Player = get_parent().get_node("Player")
onready var RockSmall = load("res://Scenes/RockSmall.tscn")

func _ready():
	for i in range(32):
		spawn_small_rock()
	set_process(true)

func _process(delta):
	var w = Game.get_viewport_rect().size.x
	if (int(Player.get_pos().x) % int(w) == 0): print("TEST")
	print(int(Player.get_pos().x) % int(w))
	
func spawn_small_rock():
	randomize()
	var screen_size = Game.get_viewport_rect().size
	var w = screen_size.x
	var h = screen_size.y
	var player_position = Player.get_pos()
	
	var rand_x_pos
	var rand_y_pos
	
	if (Math.choose(0,1)):
		rand_x_pos = player_position.x + (rand_range(w/2, w) * Math.choose(-1,1))
		rand_y_pos = player_position.y + (rand_range(-h/2, h/2) * Math.choose(-1,1))
	else:
		rand_x_pos = player_position.x + (rand_range(-w/2, w/2) * Math.choose(-1,1))
		rand_y_pos = player_position.y + (rand_range(h/2, h) * Math.choose(-1,1))
		
	
	var inst = RockSmall.instance()
	inst.set_pos(Vector2(rand_x_pos, rand_y_pos))
	add_child(inst)
	
