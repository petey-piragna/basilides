extends Control

onready var HeavenCount = $"BaseScreen/HeavenCount"
onready var Global = get_tree().get_root().get_node("Global")
onready var heavens_remaining = Global.get_heavens()

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	HeavenCount.text = str(heavens_remaining.size())
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
