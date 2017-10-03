extends Node

onready var Player = get_parent()
onready var PlayerInput = get_parent().get_node("PlayerInput")
onready var PlayerFuel = get_parent().get_node("PlayerFuel")

onready var PForward = get_parent().get_node("ParticlesForward")
onready var PBack = get_parent().get_node("ParticlesBack")

func _ready():
	set_process(true)
	
func _process(delta):
	move_particles()
	
func move_particles():
	var forward = PlayerInput.get_key_up()
	var back = PlayerInput.get_key_down()
	if (forward && PlayerFuel.get_fuel() > 0):
		PForward.set_emitting(true)
		PBack.set_emitting(false)
	elif (back && PlayerFuel.get_fuel() > 0):
		PBack.set_emitting(true)
		PForward.set_emitting(false)
	else:
		PForward.set_emitting(false)
		PBack.set_emitting(false)
		
		
