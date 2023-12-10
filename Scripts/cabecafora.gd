extends Sprite2D

@export var speed = 100
var rotation_speed = 20
var andada = 0
var moviment_direction: Vector2 = Vector2.ZERO
var angle
var direction

func _process(delta):
	angle = (position-get_global_mouse_position()).angle()
	if angle:
		global_rotation = lerp_angle(global_rotation,angle,delta*rotation_speed)
	pass
