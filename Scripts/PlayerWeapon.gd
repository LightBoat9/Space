extends Node

# Player Nodes
onready var Game = get_parent().get_parent()
onready var Player = get_parent()
onready var PlayerControl = get_parent().get_node("PlayerControl")
onready var PlayerInput = get_parent().get_node("PlayerInput")

# Particles
onready var PLeft = get_parent().get_node("ParticlesLeftGun")
onready var PRight = get_parent().get_node("ParticlesRightGun")

onready var Bullet = load("res://Scenes/PlayerBullet.tscn")

# Timer
onready var timer = Timer.new()

var can_fire = true
var fire_rate = 1 # Per Second

func _ready():
	timer.connect("timeout", self, "timer_timeout")
	timer.set_wait_time(fire_rate)
	timer.start()
	add_child(timer)
	set_process(true)

func _process(delta):
	if (PlayerInput.key_shoot):
		timer.set_active(true)
	else:	
		can_fire = false
		timer.set_wait_time(fire_rate)
		timer.set_active(false)

func timer_timeout():
	var left = Bullet.instance()
	var right = Bullet.instance()
	
	left.set_pos(PLeft.get_global_pos())
	right.set_pos(PRight.get_global_pos())
	
	left.init(PlayerControl.get_rotation())
	right.init(PlayerControl.get_rotation())
	
	Game.add_child(left)
	Game.add_child(right)
	
	PLeft.set_emitting(true)
	PRight.set_emitting(true)
	can_fire = true
