extends "String.gd"

var amount = 11110 setget , get_amount

func add_money(value):
	amount += value
	set_string(str(amount))

func get_amount():
	return amount
	
func spend(value):
	amount -= value