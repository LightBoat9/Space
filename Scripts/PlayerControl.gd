# Turns information from PlayerInput into movement
extends "BaseNode2D.gd"

# Rotation
var rotation = 0
const RotationSpeed = 0.05

# Movement
var velocity = Vector2()
var move_speed = 0
var acceleration = 0.1
var MaxMoveSpeed = 2
var MinMoveSpeed = -1

func _ready():
	set_process(true)
	
func _process(delta):
	_player_rotation()
	_player_movement()
	_collisions()
	Player.move(velocity)
	
# Rotates the player from input as long as the player has fuel
func _player_rotation():
	if (PlayerFuel.get_fuel() <= 0): return
	
	var left = PlayerInput.key_left
	var right = PlayerInput.key_right
	rotation += (left - right) * RotationSpeed
	Player.set_rot(rotation)

# Runs as long as a collision is detected 
func _collisions():
	if (!Player.is_colliding()): return
	if (Player.get_collider() == null): return
	if (Player.get_collider().is_in_group("Rocks")):
		bounce()
		Player.get_collider().set_velocity(Player.get_travel())
	
# Bounce from the collision
func bounce():
	if (!Player.is_colliding()): return
	var n = Player.get_collision_normal()
	var v = velocity
	velocity = -(2*(n*v)*n-v)/2
	move_speed = -move_speed/2
	
# Handles the players movement from input
func _player_movement():
	# Get input
	var forward = PlayerInput.get_key_up()
	var back = PlayerInput.get_key_down()
	var move = forward - back # The horizontal input as one integer 
	
	var up_rotation = rotation + PI/2 # Default rotation is to the right
	var angle_to_vector = Math.angle_to_vector(up_rotation) # Convert angle to vector
	
	if (PlayerFuel.fuel > 0):
		accelleration(move)
	
	velocity = angle_to_vector * move_speed
	fuel(move)

# Takes player input and increases or decreases the move_speed by acceleration
# see _player_movement()
func accelleration(input):
	if (input == 1): if (move_speed < MaxMoveSpeed): move_speed += acceleration
	elif (input == -1): if (move_speed > MinMoveSpeed): move_speed -= acceleration
	else: 
		if (move_speed > 0.1): move_speed -= acceleration
		elif (move_speed < -0.1): move_speed += acceleration
		else: move_speed = 0
	
func fuel(input):
	var at_base = Math.distance_to_point(Player.get_pos(), Base.get_pos()) < 100
	if (input != 0 && !at_base):
		PlayerFuel.use_fuel()
	elif (at_base):
		PlayerFuel.refuel()
		Health.heal()
	
func get_velocity():
	return velocity

func get_rotation():
	return rotation
	
func upgrade():
	MaxMoveSpeed = 2 + (PlayerUpgrades.get_level("Engine") * 0.2)
	print(MaxMoveSpeed)