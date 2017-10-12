extends "BaseNode2D.gd"

const Speed = 8
var velocity
var rotation

func init(value):
	rotation = value

func _ready():
	var up_rotation = rotation + PI/2 # Default rotation is to the right
	var angle_to_vector = Math.angle_to_vector(up_rotation) # Convert angle to vector
	velocity = angle_to_vector * Speed
	
	set_process(true)
	
func _process(delta):
	out_of_range()
	set_rot(rotation)
	_collisions()
	move(velocity)

func _collisions():
	if (!is_colliding()): return
	if (get_collider() == null): return
	
	if (get_collider().is_in_group("Rocks")):
		_destroy()
		get_collider().damage()
		pass
		
func out_of_range():
	if (distance_to_player() > 512):
		_destroy()
		
func distance_to_player():
	return Math.distance_to_point(get_pos(), Player.get_pos())
	
func _destroy():
	queue_free()