extends Node

var key_right = 0
var key_left = 0
var key_up = 0
var key_down = 0

var key_shoot = 0

func _ready():
	set_process(true)
	
func _process(delta):
	key_right = Input.is_action_pressed("key_right")
	key_left = Input.is_action_pressed("key_left")
	key_up = Input.is_action_pressed("key_up")
	key_down = Input.is_action_pressed("key_down")
	
	key_shoot = Input.is_action_pressed("key_shoot")
	
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