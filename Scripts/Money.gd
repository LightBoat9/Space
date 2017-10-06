extends Node2D

onready var tempLabel = get_node("Label")

var amount = 0 setget , get_amount

func add_money(value):
	amount += value
	tempLabel.set_text("Currency : " + str(amount))

func get_amount():
	return amount