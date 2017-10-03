extends Node

var rotation = 0
const RotationSpeed = 0.05

var move_speed = 0
var acceleration = 0.1
var MaxMoveSpeed = 3
var MinMoveSpeed = -1

onready var Player = get_parent()
onready var PlayerInput = get_parent().get_node("PlayerInput")

func _ready():
	set_process(true)
	
func _process(delta):
	_player_rotation()
	_player_movement()
	Player.set_rot(rotation)

func _player_rotation():
	var left = PlayerInput.get_key_left()
	var right = PlayerInput.get_key_right()
	rotation += (left - right) * RotationSpeed
	
func _player_movement():
	collisions()
	var forward = PlayerInput.get_key_up()
	var back = PlayerInput.get_key_down()
	var move = forward - back
	
	var up_rotation = rotation + PI/2
	var angle_to_vector = (
		Vector2(cos(up_rotation),
		-sin(up_rotation))
		)
		
	if (move == 1): 
		if (move_speed < MaxMoveSpeed): move_speed += acceleration
	elif (move == -1):
		if (move_speed > MinMoveSpeed): move_speed -= acceleration
	else: 
		if (move_speed > 0): move_speed -= acceleration
		elif (move_speed < 0): move_speed += acceleration
	
	Player.move(angle_to_vector * move_speed)

func collisions():
	if (!Player.is_colliding()): return
	if (Player.get_collider().is_in_group("Rocks")):
		move_speed = -move_speed/2
		Player.get_collider().set_velocity(Player.get_travel())