extends Node

onready var heaven_stack = []
onready var level_heaven = []
onready var heaven_available = [1,2,4,8]
onready var filter_colors = [1.5, 1.5, 1.5]
onready var final_run = false 
onready var final_run_level = 1
onready var lunge_time = 10

func set_heavens(model):
	print("hi!!!")
	heaven_stack = model

func get_heavens():
	return heaven_stack
