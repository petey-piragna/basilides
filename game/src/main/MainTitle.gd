extends Control
onready var level_select = preload("res://src/main/LevelSelect.tscn")
signal generate_heavens



func _on_Button_pressed():
	new_game()


func new_game():
	print("beginning new game")
	emit_signal("generate_heavens")
	get_tree().change_scene_to(level_select)

