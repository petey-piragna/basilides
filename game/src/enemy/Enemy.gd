class_name Enemy
extends KinematicBody2D


enum State {
	IDLE,
	ACTIVE
}

onready var vulnerability = 75
onready var vitality = 100
onready var state = State.IDLE

func activate():
	print("activating")
	state = State.ACTIVE

func execute():
	print('dying')
	randomize()
	if randi() % vulnerability >= vitality:
		queue_free()
		return true
	else:
		return false

func get_state():
	if state == State.ACTIVE:
		return "ACTIVE"
	else:
		return "IDLE"
