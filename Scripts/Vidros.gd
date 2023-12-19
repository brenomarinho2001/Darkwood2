extends Area2D

@export var player:Node2D
@export var dino_01:Node2D
@export var dino_02:Node2D



func _on_body_entered(body):
	if body.is_in_group("Player"):
		#dino_01.target_node = player
		#dino_02.target_node = player
		pass
	pass # Replace with function body.
