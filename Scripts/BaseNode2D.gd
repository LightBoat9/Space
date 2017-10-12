extends Node

onready var Root = get_tree().get_root()
onready var Game = Root.get_node("Game")

# Player Nodes
onready var Player = Root.get_node("Game/Player")
onready var PlayerControl = Player.get_node("PlayerControl")
onready var PlayerFuel = Player.get_node("PlayerFuel")
onready var PlayerGraphics = Player.get_node("PlayerGraphics")
onready var PlayerInput = Player.get_node("PlayerInput")
onready var PlayerUpgrades = Player.get_node("PlayerUpgrades")
onready var PlayerWeapon = Player.get_node("PlayerWeapon")

# GUI Nodes
onready var Fuel = Root.get_node("Game/GUI/Fuel")
onready var FuelFill = Root.get_node("Game/GUI/Fuel/Fill")
onready var Inventory = Root.get_node("Game/GUI/Inventory")
onready var Money = Root.get_node("Game/GUI/Money")

# Misc Nodes
onready var Base = Root.get_node("Game/Base")
onready var Math = Root.get_node("Game/Math")
onready var RockSpawn = Root.get_node("Game/RockSpawn")
