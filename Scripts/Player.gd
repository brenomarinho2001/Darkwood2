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
	
	
	
	if Input.is_action_pressed("ui_accept") and direction:
		Global.player_correndo = true
		if andada > 30:
			
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
		Global.player_correndo = false
		$TimerFumaca.stop()
		correu = false
		speed = 100
		$Running.visible = false
		$pernas.visible = true
		$Sprite2D.visible = true
		
	

	angle = (global_position-get_global_mouse_position()).angle()
	if angle:
		global_rotation = lerp_angle(global_rotation,angle,delta*rotation_speed)
	pass
	
	if direction:
		print($pernas.rotation)
		
		
		

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