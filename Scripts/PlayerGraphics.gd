extends Node

onready var Player = get_parent()
onready var PlayerInput = get_parent().get_node("PlayerInput")

onready var PForward = get_parent().get_node("ParticlesForward")
onready var PBack = get_parent().get_node("ParticlesBack")

func _ready():
	set_process(true)
	
func _process(delta):
	move_particles()
	
func move_particles():
	var forward = PlayerInput.get_key_up()
	var back = PlayerInput.get_key_down()
	if (forward):
		PForward.set_emitting(true)
	elif (back):
		PBack.set_emitting(true)
	else:
		PForward.set_emitting(false)
		PBack.set_emitting(false)
		
		
