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
var luz_au = false
@export var enable = false
@export var correr = true
func _ready():
	$AnimationPlayer.play("new_animation_2")
	if correr == false:
		$AnimationPlayer.play("new_animation")

		
	
	if enable:
		$mainlight.enabled = false
		$mainlight2.enabled = false
		$CanvasModulate.visible = false
	else:
		$mainlight.enabled = true
		$mainlight2.enabled = true
		$CanvasModulate.visible = true

func _physics_process(delta):
	direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")

	velocity = direction * speed
	
	$AreaLuzMain.scale = $mainlight.scale
	#print($mainlpright.scale)


	if Input.is_action_just_released("ui_accept"):
		rotation_speed = 50
	
	if Input.is_action_pressed("ui_accept") and (direction or (Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_left")) or (Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_down"))) and correr:
		$Luzcollission/CollisionPolygon2D.disabled = true
		Global.player_correndo = true
		$mainlight2.visible = false
		
		if $mainlight.scale.x <= 1.8 and luz_au == false:
			$mainlight/AnimationPlayer.play("scale_1")
		else:
			$mainlight/AnimationPlayer.play("scale_2")
		
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
		speed = lerpf(speed,200,.2)
		$Sprite2D.visible = false
		$Running.visible = true
		if !$Running/AnimationPlayer.is_playing():
			$Running/AnimationPlayer.play("animations")
	else:
		
		if luz_au == true:
			$mainlight/AnimationPlayer.play("scale_3")
		
		luz_au = false
		
		
		
		$Luzcollission/CollisionPolygon2D.disabled = false
		
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
		pass
		
		
		
		if andada > 10 and !Input.is_action_pressed("ui_accept"):
			$pernas/AnimationPlayer.play("legs_running")
		andada += 1
	else:
		andada = 0
		if $pernas.frame == 3:
			$pernas/AnimationPlayer.stop()

	
	move_and_slide()
	


func _usar():
	$mainlight/AnimationPlayer.play("scale_1")
	luz_au = true

func _on_timer_fumaca_timeout():
	randomize()
	for i in 2:
		var f = fumaca.instantiate()
		f.global_position = $Marker2D.global_position
		get_tree().current_scene.add_child(f)
	
	correu = false
	pass # Replace with function body.


func _on_area_2d_2_body_entered(body):
	if body.is_in_group('DINOESCURO'):
		body.v = true
	pass # Replace with function body.


func _on_area_2d_2_body_exited(body):
	if body.is_in_group('DINOESCURO'):
		body.v = false
	pass # Replace with function body.



func _on_area_2d_3_body_entered(body):
	if body.is_in_group('DINOESCURO'):
		body.v = true
		pass
	pass # Replace with function body.


func _on_area_2d_3_body_exited(body):
	if body.is_in_group('DINOESCURO'):
		body.v= false
		
	pass # Replace with function body.




func _on_area_2d_body_exited(body):
	pass # Replace with function body.
