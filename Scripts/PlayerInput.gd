extends Node

# Movement
var key_right = 0 setget , get_key_right
var key_left = 0 setget , get_key_left
var key_up = 0 setget , get_key_up
var key_down = 0 setget , get_key_down

# Misc
var key_shoot = 0 setget , get_key_shoot
var key_escape = 0 setget , get_key_escape

func _ready():
	set_process_input(true)
	set_process(true)
	
func _input(event):
	if (event.is_action_pressed("key_fullscreen")):
		OS.set_window_fullscreen(!OS.is_window_fullscreen())
		
func _process(delta):
	key_right = Input.is_action_pressed("key_right")
	key_left = Input.is_action_pressed("key_left")
	key_up = Input.is_action_pressed("key_up")
	key_down = Input.is_action_pressed("key_down")
	
	key_shoot = Input.is_action_pressed("key_shoot")
	key_escape = Input.is_action_pressed("key_escape")
	
func get_key_right():
	return key_right

func get_key_left():
	return key_left

func get_key_up():
	return key_up

func get_key_down():
	return key_down

func get_key_shoot():
	return key_shoot

func get_key_escape():
	return key_escape