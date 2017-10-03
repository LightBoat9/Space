extends Node

# Player Nodes
onready var Player = get_parent()
onready var PlayerInput = get_parent().get_node("PlayerInput")
onready var PlayerFuel = get_parent().get_node("PlayerFuel")

# Particle Nodes
onready var PForward = get_parent().get_node("ParticlesForward")
onready var PBack = get_parent().get_node("ParticlesBack")

func _ready():
	set_process(true)
	
func _process(delta):
	move_particles()

# Toggle the particles based on player movement
func move_particles():
	var forward = PlayerInput.key_up
	var back = PlayerInput.key_down
	if (forward && PlayerFuel.get_fuel() > 0):
		PForward.set_emitting(true)
		PBack.set_emitting(false)
	elif (back && PlayerFuel.get_fuel() > 0):
		PBack.set_emitting(true)
		PForward.set_emitting(false)
	else:
		PForward.set_emitting(false)
		PBack.set_emitting(false)
		
		
