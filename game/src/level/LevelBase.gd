extends Node2D
onready var player = $Player
onready var stage = 1
onready var camera = $Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func progress():
	camera.position.x += 320
	player.position.x = 15 + stage * 320
	stage += 1
	if stage == 10:
			end()

func end():
	get_tree().change_scene("res://src/main/LevelSelect.tscn")

func _on_Progress_body_entered(body):
	if body is Player:
		progress()
