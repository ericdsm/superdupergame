extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var move = Vector2()

var score = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_right"):
		move.x = 100
	elif Input.is_action_pressed("ui_left"):
		move.x = -100
	else:
		move.x = 0
		
	if is_on_floor():
		move.y = 0
		if Input.is_action_pressed("ui_up"):
			move.y = -300
	else:
		move.y += 9.8
		
	move_and_slide(move, Vector2.UP)

func _on_Coin_coin_collected():
	score += 10
	print(score)
