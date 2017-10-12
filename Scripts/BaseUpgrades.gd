extends "BaseNode2D.gd"

# Upgrade Nodes
onready var SelectSprite = get_node("SelectSprite")
onready var UpgradesLevel = get_node("UpgradesLevel")

onready var UpgradeCost = load("res://Scenes/UpgradeCost.tscn")
var cost_array = [] # Cost sprite instances for updating

var selection = 0
var MaxSelection = 5

var process_input = false # Toggle ability to be selected

func _ready():
	hide()
	add_cost()
	set_process(true)
	
func _input(event):
	cycle_on_input(event.is_action_pressed("key_down"),
					event.is_action_pressed("key_up"))
	if (event.is_action_pressed("key_shoot")): select_option()
	
func _process(delta):
	SelectSprite.set_pos(Vector2(-2, 8 + (selection * 8)))
	
# Add the numbers for the upgrade cost
func add_cost():
	for i in range(5):
		var inst = UpgradeCost.instance()
		cost_array.append(inst)
		inst.set_pos(Vector2(1, 9 + (8 * i)))
		inst.set_level(PlayerUpgrades.get_level(i) - 1)
		add_child(inst)

# Cycle the selected upgrade with up and down key
func cycle_on_input(key_down, key_up):
	var inp = key_down - key_up
	selection += inp
	if (selection > MaxSelection): selection = 0
	elif (selection < 0): selection = MaxSelection

func select_option():
	if (selection == 5): Player.in_menu = false # Selected "Exit"
	elif (PlayerUpgrades.get_level(selection) >= 10 ): return
	elif (Money.get_amount() >= (PlayerUpgrades.get_level(selection) * 50)):
		Money.spend((PlayerUpgrades.get_level(selection) * 50))
		PlayerUpgrades.upgrade(selection)
		cost_array[selection].set_level(PlayerUpgrades.get_level(selection) - 1)
		UpgradesLevel.update()

func toggle_input():
	if (!is_visible()): show()
	else: 
		hide() 
		selection = 0
	set_process_input(!process_input)
	process_input = !process_input