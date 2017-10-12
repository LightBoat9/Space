extends "BaseNode2D.gd"

onready var Slot = load("res://Scenes/InventorySlot.tscn")

var slot_amount = 3 setget , get_slot_amount
var slot_space = 8 # Space between slots
var slot_offset = 24 # The slot width
var item_num = 0 # Number of items

var slot_array = []

func _ready():
	instance_slots()

func instance_slots():
	for i in range(slot_amount):
		var inst = Slot.instance()
		slot_array.append(inst)
		inst.set_pos(Vector2(((slot_offset + slot_space) * i), 0))
		add_child(inst)

func add_item(value):
	if (item_num >= slot_amount): return false
	slot_array[item_num].set_item(value)
	item_num += 1
	return true

func add_slot():
	var inst = Slot.instance()
	slot_array.append(inst)
	inst.set_pos(Vector2(((slot_offset + slot_space) * slot_amount), 0))
	add_child(inst)
	slot_amount += 1

func get_slot_amount():
	return slot_amount

func sell_items():
	var num = 0
	for i in slot_array:
		num += i.sell_item()
	item_num = 0
	Money.add_money(num)