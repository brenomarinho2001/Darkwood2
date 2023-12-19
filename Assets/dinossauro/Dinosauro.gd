extends CharacterBody2D


var direction = Vector2()
var speed = 64.0 # velocidade de 64 pixels por segundo

@onready var agent = $NavigationAgent2D


func _physics_process(delta: float) -> void:
	var target = Vector2(400, 400) # trocar por player.global_position
	agent.target_position = target
	
	agent.target_position = target
	direction = global_position.direction_to(agent.get_next_path_position())
	velocity = direction * speed
	
	move_and_slide()
