class_name Enemy
extends KinematicBody2D


enum State {
	IDLE,
	ACTIVE
}

onready var state = State.IDLE

func activate():
	print("activating")
	state = State.ACTIVE

func execute():
	print('dying')
	queue_free()

func get_state():
	if state == State.ACTIVE:
		return "ACTIVE"
	else:
		return "IDLE"
