extends "BaseNode2D.gd"

var at_base = false
var in_menu = false
	
func _ready():
	add_to_group("Player")
	
	set_process_input(true)
	set_process(true)

func _input(event):
	at_base = Math.distance_to_point(get_pos(), Base.get_pos()) < 50
	if (!in_menu && at_base && event.is_action_pressed("key_shoot")):
		in_menu = true

func _process(delta):
	if (in_menu): 
		PlayerControl.set_process(false)
		PlayerGraphics.set_process(false)
	else: 
		PlayerControl.set_process(true)
		PlayerGraphics.set_process(true)
