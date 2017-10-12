extends "BaseNode2D.gd"

var LevelSprite = load("res://Scenes/LevelSprite.tscn")

func _ready():
	update()
	
func update():
	for i1 in range(5):
		for i2 in range(PlayerUpgrades.get_level(i1)):
			var inst = LevelSprite.instance()
			inst.set_pos(Vector2(6 * i2, 8 * i1))
			add_child(inst)