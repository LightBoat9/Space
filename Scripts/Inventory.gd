# The GUI node for the amount of fuel the Player has left
extends "BaseNode2D.gd"

onready var Slot = load("res://Scenes/InventorySlot.tscn")

const slot_space = 8 # Space between slots
const slot_offset = 24 # The slot width
var slot_amount = 3 setget , get_slot_amount
var item_num = 0 # Number of items

var slot_array = []

func _ready():
	instance_slots()

# Add the slots based on slot_amount
func instance_slots():
	for i in range(slot_amount):
		var inst = Slot.instance()
		slot_array.append(inst)
		inst.set_pos(Vector2(((slot_offset + slot_space) * i), 0))
		add_child(inst)
	
# Add an item to a slot if there is a slot available 
func add_item(value):
	if (item_num >= slot_amount): return false
	slot_array[item_num].set_item(value)
	item_num += 1
	return true

# Add another slot for holding items
func upgrade():
	var inst = Slot.instance()
	slot_array.append(inst)
	inst.set_pos(Vector2(((slot_offset + slot_space) * slot_amount), 0))
	add_child(inst)
	slot_amount += 1

func get_slot_amount():
	return slot_amount

# Remove all items and add money based on their value
func sell_items():
	var num = 0
	for i in slot_array:
		num += i.sell_item()
	item_num = 0
	Money.add_money(num)