extends CharacterBody2D

@export var speed = 150
@export var nav_agent:NavigationAgent2D 
@export var marker:Marker2D
var vendo = false
var target_node = null
var home_pos = Vector2.ZERO
var v = false
@export var lugares:Array  
var i = 0
var estados = 'p'
var calcular_patrulha = false
func _ready():
	print(lugares)
	nav_agent = $Navigation/NavigationAgent2D
	home_pos = self.global_position
	
	if lugares.size() > 0:
		marker.position = lugares[i]
	
	nav_agent.path_desired_distance = 4
	nav_agent.target_desired_distance = 10
	
func _physics_process(_delta):
	#print(v)
	#print((lugares[i] - global_position))

			
		
	var axis = to_local(nav_agent.get_next_path_position()).normalized()
	velocity = axis * speed
	
	if target_node:
		$Sprite2D.look_at(target_node.position)
		$Aggro.look_at(target_node.position)

		pass

	else:
		$Sprite2D.look_at(global_position+velocity)
		$Aggro.look_at(global_position+velocity)
		pass

			
			
			
			
			

		
	move_and_slide()
	
	if v == true:
		modulate.a = lerpf(modulate.a,1,.1)
		pass
	else:
		modulate.a = lerpf(modulate.a,0,.1)
		pass
	if nav_agent.is_navigation_finished():
		return
	

	

func recale_path():
	if target_node:
		nav_agent.target_position = target_node.global_position
	else:
		nav_agent.target_position = home_pos
		pass

func _on_recalculate_timer_timeout():
	recale_path()
	pass # Replace with function body.



func _on_aggro_range_area_entered(area):
	if area.is_in_group("Player"):
		target_node = area.owner


	pass # Replace with function body.





func _on_aggro_range_area_exited(area):
	if area.is_in_group("Player"):
		target_node = false
	pass # Replace with function body.


func _on_area_2d_body_entered(body):
	if body.is_in_group('Player'):
		get_tree().change_scene_to_file('res://Scenes/game_over.tscn')
		pass
	pass # Replace with function body.


func _on_timer_timeout():
	pass # Replace with function body.
