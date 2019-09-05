extends Node2D

export var skipto = "TargetScene"

onready var GameData = get_node("/root/GameData")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_down"):
		get_tree().change_scene(skipto)
		GameData.lives = 3
		GameData.score = 0