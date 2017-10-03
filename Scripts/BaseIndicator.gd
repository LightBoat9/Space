extends KinematicBody2D

# Nodes
onready var Player = get_parent().get_node("Player")
onready var Base = get_parent().get_node("Base")
onready var Math = get_parent().get_node("Math")

var position = Vector2()
var rotation = Vector2()
var distance = 25

func _ready():
	set_process(true)

func _process(delta):
	rotation()
	position()
	set_rot(rotation.angle() - 135)
	set_pos(position)
	
func rotation():
	rotation.x = Base.get_pos().x - Player.get_pos().x
	rotation.y = Base.get_pos().y - Player.get_pos().y

func position():
	position.x = Player.get_pos().x + (rotation.normalized().x * distance)
	position.y = Player.get_pos().y + (rotation.normalized().y * distance)