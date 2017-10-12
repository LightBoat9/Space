extends "BaseNode2D.gd"

# Upgrade Nodes
onready var SelectSprite = get_node("SelectSprite")
onready var UpgradesLevel = get_node("UpgradesLevel")

onready var UpgradeCost = load("res://Scenes/UpgradeCost.tscn")

var selection = 0
var MaxSelection = 5

var process_input = false

var cost_array = [] # Cost sprite instances for updating

func _ready():
	add_cost()
	set_process(true)
	
func _input(event):
	cycle_on_input(event)
	select_option(event)
	
func _process(delta):
	toggle_input()
	SelectSprite.set_pos(Vector2(-2, 8 + (selection * 8)))
	
func add_cost():
	for i in range(5):
		var inst = UpgradeCost.instance()
		cost_array.append(inst)
		inst.set_pos(Vector2(1, 9 + (8 * i)))
		inst.set_level(PlayerUpgrades.get_level(i) - 1)
		add_child(inst)

func cycle_on_input(event):
	if (event.is_action_pressed("key_down")):
		if (selection < MaxSelection): selection += 1
		else: selection = 0
	elif (event.is_action_pressed("key_up")):
		if (selection > 0): selection -= 1
		else: selection = MaxSelection

func select_option(event):
	if (event.is_action_pressed("key_shoot")):
		if (selection == 5):
			Player.in_menu = false
		elif (Money.get_amount() >= (PlayerUpgrades.get_level(selection) * 50)):
			if (PlayerUpgrades.get_level(selection) < 10):
				Money.spend((PlayerUpgrades.get_level(selection) * 50))
				PlayerUpgrades.upgrade(selection)
				cost_array[selection].set_level(PlayerUpgrades.get_level(selection) - 1)
				UpgradesLevel.update()

func toggle_input():
	if (Player.in_menu):
		if (!is_visible()): show()
		if (!process_input): 
			set_process_input(true)
			process_input = true
	else:
		if (is_visible()): hide()
		selection = 0
		if (process_input):
			set_process_input(false)
			process_input = false