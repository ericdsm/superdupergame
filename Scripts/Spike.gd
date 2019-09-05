extends Area2D

func _on_Area2D_body_entered(body : PhysicsBody2D)->void:
	if body.is_in_group("Player"):
		emit_signal("spiked")

signal spiked
