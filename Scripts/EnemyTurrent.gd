extends "BaseNode2D.gd"

onready var TurrentTop = get_node("TurrentTop")

var rotation = Vector2()

var velocity
var speed = 0.5

func _ready():
	randomize()
	velocity = Vector2(rand_range(-speed,speed),rand_range(-speed,speed))
	set_process(true)
	
func _process(delta):
	rotation()
	TurrentTop.set_rot(rotation.angle() - 135)
	move(velocity)
	
# Rotates towards the player
func rotation():
	rotation.x = get_pos().x - Player.get_pos().x
	rotation.y = get_pos().y - Player.get_pos().y