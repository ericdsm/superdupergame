extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var move = Vector2()

onready var GameData = get_node("/root/GameData")
onready var LivesLabel = get_node("/root/Root/CanvasLayer/LivesLabel")
onready var ScoreLabel = get_node("/root/Root/CanvasLayer/ScoreLabel")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_right"):
		move.x = 200
	elif Input.is_action_pressed("ui_left"):
		move.x = -200
	else:
		move.x = 0
		
	if is_on_floor():
		move.y = 0
		if Input.is_action_pressed("ui_up"):
			move.y = -300 * 1.5
	else:
		move.y += 9.8 * 2
		
	move_and_slide(move * delta * 80, Vector2.UP)

func _on_Coin_coin_collected():
	GameData.score += 10
	ScoreLabel.set_text(str("Score: ", GameData.score))
