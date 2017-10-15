# The indicator for the direction of the base from the player
extends "BaseNode2D.gd"

var position = Vector2()
var rotation = Vector2()
var distance = 25 # Distance to orbit around player

func _ready():
	set_process(true)

func _process(delta):
	rotation()
	position()
	set_rot(rotation.angle() - 135 - Player.get_rot())
	set_global_pos(position)

# Rotates towards the base
func rotation():
	rotation.x = Base.get_pos().x - Player.get_pos().x
	rotation.y = Base.get_pos().y - Player.get_pos().y

# Sets the position orbited around the player towards the base
func position():
	position.x = Player.get_pos().x + (rotation.normalized().x * distance)
	position.y = Player.get_pos().y + (rotation.normalized().y * distance)