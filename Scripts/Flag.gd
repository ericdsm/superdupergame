extends Area2D

export var target = "TargetLevel"

func _on_Area2D_body_entered(body : PhysicsBody2D)->void:
	if body.is_in_group("Player"):
		emit_signal("nextlevel", target)

signal nextlevel
