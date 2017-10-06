extends KinematicBody2D

var rotation = 0
var RotationSpeed

var velocity
var speed = 0.5

onready var Player = get_parent().get_node("Player")
onready var RockSpawn = get_parent().get_node("RockSpawn")

onready var MSilver = load("res://Scenes/MineralSilver.tscn")

func _ready():
	add_to_group("Rocks")
	
	randomize()
	velocity = Vector2(rand_range(-speed,speed),rand_range(-speed,speed))
	RotationSpeed = rand_range(0.01, 0.05)
	set_process(true)
	
func _process(delta):
	rotation += RotationSpeed
	set_rot(rotation)
	
	if (dist_to_player() > 512):
		out_of_range()
		
	_collisions()
	
	move(velocity)

func set_velocity(value):
	velocity += value / 4

func reverse():
	velocity = -velocity/2
	
func dist_to_player():
	return sqrt(pow((Player.get_pos().x - get_pos().x), 2) + pow((Player.get_pos().y - get_pos().y), 2))

func out_of_range():
	RockSpawn.rock_amount -= 1
	queue_free()

func _collisions():
	if (!is_colliding()): return
	var collider = get_collider()
	
	if (collider == null): return
	
	if (collider.is_in_group("Rocks")):
		set_velocity(-velocity)
		collider.set_velocity(velocity)
	elif (collider == Player):
		reverse()

func damage():
	_destroy()

func _destroy():
	var inst = MSilver.instance()
	inst.set_pos(get_pos())
	get_parent().call_deferred("add_child", inst)
	queue_free()