extends CharacterBody2D

class_name  Player
@onready var fumaca = preload('res://Scenes/fumaca.tscn')
@export var speed = 100
var rotation_speed = 15
var andada = 0
var moviment_direction: Vector2 = Vector2.ZERO
var angle
var direction

var correu = false



func _physics_process(delta):
	direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")

	velocity = direction * speed
	
	
		
	
	
	print(rotation_degrees)
	print(get_global_mouse_position())
	
	if Input.is_action_just_released("ui_accept"):
		rotation_speed = 35
	
	if Input.is_action_pressed("ui_accept") and (direction or (Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_left")) or (Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_down"))):
		Global.player_correndo = true
		$mainlight2.visible = false
		
		# UP 
		if Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_right"):
			rotation_degrees = 45
			pass
		
		elif Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_left"):
			rotation_degrees = -45
			pass
		
		elif Input.is_action_pressed("ui_up"):
			rotation_degrees = 0
		
		#Down
		
		elif Input.is_action_pressed("ui_down") and Input.is_action_pressed("ui_right"):
			rotation_degrees = -225
			pass
		
		elif Input.is_action_pressed("ui_down") and Input.is_action_pressed("ui_left"):
			rotation_degrees = 225
			pass

		elif Input.is_action_pressed("ui_down"):
			rotation_degrees = 180
			pass
		elif Input.is_action_pressed("ui_right"):
			rotation_degrees = 90
		elif Input.is_action_pressed("ui_left"):
			rotation_degrees = -90
		

		
		if andada > 30:
			
			
			
			pass
			
			if correu == false:
				
				$TimerFumaca.start()
				correu = true

			
			
			
			correu = true
		
		$pernas.visible = false
		speed = lerpf(speed,250,.2)
		$Sprite2D.visible = false
		$Running.visible = true
		$Running/AnimationPlayer.play("animations")
	else:
		rotation_speed = lerpf(rotation_speed,15,.1)
		Global.player_correndo = false
		$TimerFumaca.stop()
		correu = false
		speed = 100
		$Running.visible = false
		#$pernas.visible = true
		$Sprite2D.visible = true
		$mainlight2.visible = true
	

		angle = (global_position-get_global_mouse_position()).angle()
		if angle:
			global_rotation = lerp_angle(global_rotation,angle,delta*rotation_speed)
		#pass
	
	if direction:
		#print($pernas.rotation)
		
		
		

		if andada > 10:
			$pernas/AnimationPlayer.play("legs_running")
		andada += 1
	else:
		andada = 0
		if $pernas.frame == 3:
			$pernas/AnimationPlayer.stop()

	
	move_and_slide()
	





func _on_timer_fumaca_timeout():
	randomize()
	for i in 2:
		var f = fumaca.instantiate()
		f.global_position = $Marker2D.global_position
		get_tree().current_scene.add_child(f)
	
	correu = false
	pass # Replace with function body.
