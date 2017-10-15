extends Node2D

onready var Heart = load("res://Textures/player_heart.png")

const heart_space = 8 # Space between hearts
const heart_offset = 24 # The heart width

var max_health_amount = 3 setget , get_max_health_amount
var health = max_health_amount setget , get_health

var health_array = []

func _ready():
	instance_slots()
	hurt()
	
# Add the slots based on max_health_amount
func instance_slots():
	for i in range(max_health_amount):
		var inst = Sprite.new()
		inst.set_texture(Heart)
		inst.set_pos(Vector2((-(heart_offset + heart_space) * i), 0))
		health_array.append(inst)
		add_child(inst)
	
func get_health():
	return health
	
func get_max_health_amount():
	return max_health_amount
	
func upgrade():
	var inst = Sprite.new()
	inst.set_texture(Heart)
	inst.set_pos(Vector2((-(heart_offset + heart_space) * max_health_amount), 0))
	health_array.append(inst)
	add_child(inst)
	max_health_amount += 1
	
func heal():
	if (health == max_health_amount): return
	for i in health_array:
		i.queue_free()
	health_array = []
	instance_slots()
	health = max_health_amount
	
func hurt():
	if (health <= 0): return
	health -= 1
	health_array[health].queue_free()
	health_array.remove(health)