extends KinematicBody2D

# Nodes
onready var Math = get_parent().get_node("Math")

var speed = 8
var velocity
var rotation

func init(value):
	rotation = value

func _ready():
	var up_rotation = rotation + PI/2 # Default rotation is to the right
	var angle_to_vector = Math.angle_to_vector(up_rotation) # Convert angle to vector
	velocity = angle_to_vector * speed
	
	set_process(true)
	
func _process(delta):
	set_rot(rotation)
	move(velocity)
