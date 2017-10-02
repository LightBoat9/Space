extends KinematicBody2D

var rotation = 0
var RotationSpeed

var velocity
var speed = 0.5

func _ready():
	randomize()
	velocity = Vector2(rand_range(-speed,speed),rand_range(-speed,speed))
	RotationSpeed = rand_range(0.01, 0.05)
	set_process(true)
	
func _process(delta):
	rotation += RotationSpeed
	set_rot(rotation)
	
	#move(velocity)

func set_velocity(value):
	velocity += value/4
