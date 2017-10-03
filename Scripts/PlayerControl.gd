extends Node

# Player Nodes
onready var Player = get_parent()
onready var PlayerInput = get_parent().get_node("PlayerInput")
onready var PlayerFuel = get_parent().get_node("PlayerFuel")

# Other Nodes
onready var Math = get_parent().get_parent().get_node("Math")

# Rotation
var rotation = 0
const RotationSpeed = 0.05

# Movement
var move_speed = 0
var acceleration = 0.1
var MaxMoveSpeed = 3
var MinMoveSpeed = -1

func _ready():
	set_process(true)
	
func _process(delta):
	_player_rotation()
	_collisions()
	_player_movement()
	
# Rotates the player from input as long as the player has fuel
func _player_rotation():
	if (PlayerFuel.get_fuel() <= 0): return
	
	var left = PlayerInput.get_key_left()
	var right = PlayerInput.get_key_right()
	rotation += (left - right) * RotationSpeed
	Player.set_rot(rotation)

# Runs as long as a collision is detected 
func _collisions():
	if (!Player.is_colliding()): return
	if (Player.get_collider().is_in_group("Rocks")):
		move_speed = -(round(move_speed/2))
		Player.get_collider().set_velocity(Player.get_travel())
	
# Handles the players movement from input
func _player_movement():
	# Get input
	var forward = PlayerInput.get_key_up()
	var back = PlayerInput.get_key_down()
	var move = forward - back # The horizontal input as one integer 
	
	var up_rotation = rotation + PI/2 # Default rotation is to the right
	var angle_to_vector = Math.angle2vector(up_rotation) # Convert angle to vector
	
	if (PlayerFuel.fuel > 0):
		accelleration(move)
	
	Player.move(angle_to_vector * move_speed)
	if (move != 0): PlayerFuel.use_fuel()

# Takes player input and increases or decreases the move_speed by acceleration
# see _player_movement()
func accelleration(input):
	if (input == 1): if (move_speed < MaxMoveSpeed): move_speed += acceleration
	elif (input == -1): if (move_speed > MinMoveSpeed): move_speed -= acceleration
	else: 
		if (move_speed > 0.1): move_speed -= acceleration
		elif (move_speed < -0.1): move_speed += acceleration
		else: move_speed = 0