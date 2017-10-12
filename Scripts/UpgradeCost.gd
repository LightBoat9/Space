extends Node2D

var one = load("res://Textures/cost_50.png")
var two = load("res://Textures/cost_100.png")
var three = load("res://Textures/cost_150.png")
var four = load("res://Textures/cost_200.png")
var five = load("res://Textures/cost_250.png")
var six = load("res://Textures/cost_300.png")
var seven = load("res://Textures/cost_350.png")
var eight = load("res://Textures/cost_400.png")
var nine = load("res://Textures/cost_450.png")
var ten = load("res://Textures/cost_500.png")

var num = 0
var levels = [one, two, three, four, five, six, seven, eight, nine, ten]
	
func set_level(value):
	num = value
	set_texture(levels[num])
