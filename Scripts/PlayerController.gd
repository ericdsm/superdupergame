extends KinematicBody2D


onready var GameData = get_node("/root/GameData")
onready var LivesLabel = get_node("/root/Root/CanvasLayer/LivesLabel")
onready var ScoreLabel = get_node("/root/Root/CanvasLayer/ScoreLabel")

var move = Vector2()

func _ready():
	updateUi()

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
			move.y = -300 * 2
	else:
		move.y += 9.8 * 2
		
	move_and_slide(move * delta * 80, Vector2.UP)
		

func _on_Coin_coin_collected():
	GameData.score += 10
	updateUi()
	
func updateUi():
	LivesLabel.set_text(str("Lives: ", GameData.lives))
	ScoreLabel.set_text(str("Score: ", GameData.score))

func _on_Area2D_spiked():
	GameData.lives -= 1
	updateUi()
	get_tree().reload_current_scene()


func _on_Flag_nextlevel(level):
	get_tree().change_scene(level)
