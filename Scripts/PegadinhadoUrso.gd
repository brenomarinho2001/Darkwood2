extends Area2D
var ataque = false



func _on_body_entered(body):
	if body.is_in_group('Player'):
		get_tree().change_scene_to_file('res://Scenes/game_over.tscn')

	pass # Replace with function body.
