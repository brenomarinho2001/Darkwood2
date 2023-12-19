extends CharacterBody2D


var direction = Vector2()
@export var speed = 90.0 # velocidade de 64 pixels por segundo
@export var player:Node2D
var home_pos 
@onready var agent = $NavigationAgent2D
var target = null
func _ready():
	home_pos = global_position

func _physics_process(delta: float) -> void:
	#$AnimationPlayer.play("anim")
	if target:
		 # trocar por player.global_position
		agent.target_position = target.global_position
		
		agent.target_position = target.global_position
		direction = global_position.direction_to(agent.get_next_path_position())
		velocity = direction * speed
		
		$Sprite2D.look_at(target.global_position)
		
	else:
		agent.target_position = home_pos
		
		agent.target_position = home_pos
		if direction:
			direction = global_position.direction_to(agent.get_next_path_position())
		velocity = direction * speed
		$Sprite2D.look_at(home_pos)
		if global_position == home_pos:
			velocity = Vector2.ZERO
		else:
			velocity = direction * speed
		
		pass
	
	move_and_slide()


func _on_area_2d_body_entered(body):
	if body.is_in_group('Player'):
		target = body
	pass # Replace with function body.


func _on_area_2d_body_exited(body):
	if body.is_in_group('Player'):
		target = null
	pass # Replace with function body.


func _on_area_2d_2_body_entered(body):
	if body.is_in_group('Player'):
		get_tree().change_scene_to_file('res://Scenes/game_over.tscn')
	pass # Replace with function body.
