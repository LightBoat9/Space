extends Node2D

var screen_size;
var w
var h 
var mid_point

var rock_amount = 0
var max_rock_amount = 32

onready var Math = get_parent().get_node("Math")

onready var RockSpawn = load("res://Scenes/RockSpawn.tscn")

onready var Game = get_parent()
onready var Player = get_parent().get_node("Player")
onready var SpawnArea = get_node("SpawnArea")

onready var RockSmall = load("res://Scenes/RockSmall.tscn")

func _ready():
	screen_size = Game.get_viewport_rect().size
	w = screen_size.x
	h = screen_size.y
	mid_point = Vector2(w, h)
	
	SpawnArea.connect("body_enter", self, "player_enter")
	
	set_process(true)

func _process(delta):
	spawn_random_rocks()
	pass

func player_enter(body):
	pass

func spawn_random_rocks():
	while (rock_amount < max_rock_amount):
		spawn_small_rock()
		rock_amount += 1
	
func spawn_small_rock():
	randomize()
	
	var screen_size = Game.get_viewport_rect().size
	
	var rand_x_pos
	var rand_y_pos
	
	if (Math.choose(0,1)):
		rand_x_pos = Player.get_pos().x + (rand_range(w/2, w) * Math.choose(-1,1))
		rand_y_pos = Player.get_pos().y + rand_range(-h/2, h/2)
	else:
		rand_x_pos = Player.get_pos().x + rand_range(-w/2, w/2)
		rand_y_pos = Player.get_pos().y + (rand_range(h/2, h) * Math.choose(-1,1))
	
	var inst = RockSmall.instance()
	inst.set_pos(Vector2(rand_x_pos, rand_y_pos))
	get_parent().call_deferred("add_child", inst)