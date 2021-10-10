extends Node

onready var heaven_stack = []
onready var level_heaven = []
onready var heaven_available = [1,2,4,8]
onready var filter_colors = [1.5, 1.5, 1.5]

func set_heavens(model):
	print("hi!!!")
	heaven_stack = model

func get_heavens():
	return heaven_stack
