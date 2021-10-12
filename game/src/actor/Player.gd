class_name Player
extends KinematicBody2D




onready var direction = Vector2.ZERO
onready var _velocity = Vector2.ZERO
onready var speed = Vector2(3,2)
onready var _state = State.FREE
onready var enemies = $"../Enemies"
onready var _face = Face.RIGHT
onready var collision
onready var enemy_list = []

enum State {
	FREE,
	EXECUTE
}

enum Face {
	RIGHT,
	LEFT
}



func _process(delta):

	# allows player in FREE state to move
	if _state == State.FREE:
		direction = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
		)
		
		if direction.x > 0:
			_face = Face.RIGHT
		elif direction.x < 0:
			_face = Face.LEFT
		_velocity = direction * speed * 2
		collision = move_and_collide(_velocity)
		
		if Input.is_action_just_pressed("execute"):
			_state = State.EXECUTE
			lunge()
		
	if _state == State.EXECUTE:
		direction = direct_toward(enemy_list[0].position)
		_velocity = direction * speed
		collision = move_and_collide(_velocity)
		if collision:
			if collision.collider_id == enemy_list[0].get_instance_id():
				if enemy_list[0].execute():
					_state = State.FREE
				else: stun()
			_state = State.FREE

func lunge():
	print("hehe")
	enemy_list = []
	for Enemy in enemies.get_children():
		if _face == Face.RIGHT && Enemy.position.x > position.x:
			enemy_list.push_back(Enemy)
		elif _face == Face.LEFT && Enemy.position.x < position.x:
			enemy_list.push_back(Enemy)
	if enemy_list.size() == 0:
		_state = State.FREE
		return false
	enemy_list.sort_custom(self, "hypo_sort")

func stun():
	print("stunned")

func execute():
	enemy_list[0].execute()
	_state = State.FREE

func hypo_sort(a, b):
	if hypo(a) < hypo(b):
		return true
	else:
		return false

func direct_toward(enemy):
	print(position - enemy)
	var angle = tan((position.y - enemy.y) / (position.x - enemy.x))
	print(angle)
	var result = Vector2(cos(angle), sin(angle))
	if _face == Face.LEFT:
		result *= -1
	print(result)
	return result

func hypo(enemy):
	var result = sqrt(pow(abs(position.x - enemy.position.x), 2) + pow(abs(position.y - enemy.position.y), 2))
	return result
