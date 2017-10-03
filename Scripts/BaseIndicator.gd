extends KinematicBody2D

var vec = Vector2()
var rotation = Vector2()
var distance = 25

onready var Player = get_parent().get_node("Player")
onready var Base = get_parent().get_node("Base")

func _ready():
	set_process(true)

func _process(delta):
	rotation.x = Base.get_pos().x - Player.get_pos().x
	rotation.y = Base.get_pos().y - Player.get_pos().y
	
	vec.x = Player.get_pos().x + (rotation.normalized().x * distance)
	vec.y = Player.get_pos().y + (rotation.normalized().y * distance)
	
	
	set_rot(rotation.angle() - 135)
	set_pos(vec)
	
