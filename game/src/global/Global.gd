extends Node

onready var heaven_stack = []

func set_heavens(model):
	print("hi!!!")
	heaven_stack = model

func get_heavens():
	return heaven_stack
