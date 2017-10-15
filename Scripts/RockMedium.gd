extends "BaseNode2D.gd"

onready var SmallParticles = load("res://Scenes/RockSmallParticles.tscn")
onready var MGold = load("res://Scenes/MineralGold.tscn")
onready var MSilver = load("res://Scenes/MineralSilver.tscn")

var rotation = 0
var RotationSpeed

var velocity
var speed = 0.25
var mass = 4

var hitpoints = 2

func _ready():
	add_to_group("Rocks")
	
	randomize()
	velocity = Vector2(rand_range(-speed,speed),rand_range(-speed,speed))
	RotationSpeed = rand_range(0.01, 0.05)
	set_process(true)
	
func _process(delta):
	rotation += RotationSpeed
	set_rot(rotation)
	
	out_of_range()
		
	_collisions()
	
	move(velocity)

func set_velocity(value):
	velocity += value / 4

func reverse():
	velocity = -velocity / mass
	
func distance_to_player():
	return Math.distance_to_point(get_pos(), Player.get_pos())

func out_of_range():
	if (distance_to_player() > 512):
		RockSpawn.rock_amount -= 1
		_destroy_no_drop()

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
	if (hitpoints > 0):
		hitpoints -= 1
		spawn_particles()
	if (hitpoints <= 0):
		_destroy()

func _destroy():
	drop_item()
	spawn_particles()
	queue_free()
	
func _destroy_no_drop():
	queue_free()

func spawn_particles():
	var inst = SmallParticles.instance()
	inst.set_pos(get_pos())
	inst.set_z(-1)
	get_parent().call_deferred("add_child", inst)
	
func drop_item():
	randomize()
	for i in range(2):
		var inst = MSilver.instance()
		var rand = rand_range(0, 100)
		if (rand < 60): inst = MSilver.instance()
		else: inst = MGold.instance()
		inst.init(RotationSpeed)
		inst.set_pos(Vector2(get_pos().x + (16 * i), get_pos().y))
		get_parent().call_deferred("add_child", inst)