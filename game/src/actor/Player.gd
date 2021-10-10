extends KinematicBody2D



onready var direction = Vector2.ZERO
onready var _velocity = Vector2.ZERO
onready var speed = Vector2(5,2)





func _process(delta):
	direction = Vector2(
	Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
	Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	)
	if direction != Vector2.ZERO:
		print(direction)
	
	_velocity = direction * speed
# warning-ignore:return_value_discarded
	move_and_collide(_velocity)

