extends Control

onready var HeavenCount = $"BaseScreen/HeavenCount"
onready var Global = get_tree().get_root().get_node("Global")
onready var heavens_remaining = Global.get_heavens()


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	HeavenCount.text = str(heavens_remaining.size())
	pass # Replace with function body.

func spend_heavens(level):
	print("charging for level " + str(level))
	var i = 0
	while heavens_remaining.size() > 0:
		if heavens_remaining[i][0] % Global.heaven_available[level - 1] == 0 && heavens_remaining[i][0] != 0:
			print(heavens_remaining[i])
			Global.level_heaven = heavens_remaining[i].slice(1, heavens_remaining[i].size())
			heavens_remaining.pop_front()
			break
		else:
			heavens_remaining.pop_front()
	HeavenCount.text = str(heavens_remaining.size())
	if heavens_remaining.size() == 0:
		print("all out")
	else:
		get_tree().change_scene("res://src/level/Level" + str(level) + ".tscn")



func _on_LevelOne_pressed():
	spend_heavens(1)


func _on_LevelTwo_pressed():
	spend_heavens(2)

func _on_LevelThree_pressed():
	spend_heavens(3)

func _on_LevelFour_pressed():
	spend_heavens(4)
