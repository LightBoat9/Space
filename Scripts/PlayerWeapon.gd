extends "BaseNode2D.gd"

# Particles
onready var PLeft = get_parent().get_node("ParticlesLeftGun")
onready var PRight = get_parent().get_node("ParticlesRightGun")

onready var Bullet = load("res://Scenes/PlayerBullet.tscn")

# Timer
onready var timer = Timer.new()

var can_shoot = true
var fire_rate = 1 # Per Second

func _ready():
	initialize_timer()
	set_process(true)

func _process(delta):
	var at_base = Math.distance_to_point(Player.get_pos(), Base.get_pos()) < 100
	if (can_shoot && PlayerInput.key_shoot && !at_base):
		fire()

func initialize_timer():
	timer.connect("timeout", self, "timer_timeout")
	timer.set_wait_time(fire_rate)
	timer.set_one_shot(true)
	timer.start()
	add_child(timer)
	
func timer_timeout():
	can_shoot = true
	
func fire():
	var left = Bullet.instance()
	var right = Bullet.instance()
	
	left.set_pos(PLeft.get_global_pos())
	right.set_pos(PRight.get_global_pos())
	
	left.init(PlayerControl.get_rotation())
	right.init(PlayerControl.get_rotation())
	
	Game.add_child(left)
	Game.add_child(right)
	
	can_shoot = false
	
	timer.set_wait_time(fire_rate)
	timer.start()
	
	# Particles
	PLeft.set_emitting(true)
	PRight.set_emitting(true)

func upgrade():
	fire_rate = 1.1 - (0.1 * PlayerUpgrades.get_level("Weapon"))