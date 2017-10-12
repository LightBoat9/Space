extends Node2D

# Nodes
onready var ItemSprite = get_node("ItemSprite")

# Textures
var TSilver = preload("res://Textures/mineral_silver.png")
var TGold = preload("res://Textures/mineral_gold.png")

var textures = {
	"Silver" : TSilver,
	"Gold" : TGold
}

var values = {
	"Silver" : 5,
	"Gold" : 10
}

var item = null setget set_item, get_item

func _ready():
	pass

func set_item(value):
	item = value
	var tex
	for i in textures:
		if (i == item): 
			tex = textures[i]
	ItemSprite.set_texture(tex)
	

func get_item():
	return item
	
func sell_item():
	var num = 0
	for i in values:
		if (i == item): 
			num = values[i]
	set_item(null)
	return num