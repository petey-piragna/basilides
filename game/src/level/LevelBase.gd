extends Node2D
onready var player = $Player
onready var stage = 1
onready var camera = $Camera2D
onready var Global = $"/root/Global"
onready var level_heaven = Global.level_heaven
onready var heaven_filter = $HeavenFilter
onready var filter_colors = Global.filter_colors
onready var temp_color = [150, 150, 150, 100]
onready var final_run_level = Global.final_run_level


# Called when the node enters the scene tree for the first time.
func _ready():
	if level_heaven.size():
		_update_filter()
	player.position.x = 15
	player.position.y = 200
	activate_stage()

func _update_filter():
	var i = 0
	while i < 3:
		temp_color[i] = level_heaven[i] * filter_colors[i] 
		i += 1
	temp_color[3] = 150
	heaven_filter.color = Color8(temp_color[0], temp_color[1], temp_color[2], temp_color[3])
	print(heaven_filter.color)

func progress():
	camera.position.x += 320
	player.position.x = 15 + stage * 320
	stage += 1
	if stage == 10:
			end()

func end():
	print("ind")
	if Global.final_run == true:
		if final_run_level == 4:
			get_tree().change_scene("res://src/main/Game.tscn")
		else:
			Global.final_run_level += 1
			print("level" + str(final_run_level + 1))
			get_tree().change_scene("res://src/level/Level" + str(final_run_level + 1) + ".tscn")	
	else:
		get_tree().change_scene("res://src/main/LevelSelect.tscn")

func _on_Progress_body_entered(body):
	if body is Player:
		for Enemy in $Enemies.get_children():
			if Enemy.get_state() == "ACTIVE":
				return false	
		progress()

func activate_stage():
	get_tree().call_group("stage" + str(stage), "activate")
