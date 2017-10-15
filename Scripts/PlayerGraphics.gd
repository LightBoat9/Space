# Handles the player particles
extends "BaseNode2D.gd"

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
	if ((forward || back) && PlayerFuel.get_fuel() > 0 && !Player.in_menu):
		PForward.set_emitting(Math.conditional(back, false, forward))
		PBack.set_emitting(Math.conditional(forward, false, back))
	else:
		PForward.set_emitting(false)
		PBack.set_emitting(false)
		
		
