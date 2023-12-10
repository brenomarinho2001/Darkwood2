extends Sprite2D

var rotation_speed = 20
var angle 

func _process(delta):
	angle = (get_global_mouse_position()-global_position).angle()
	if angle:
		global_rotation = lerp_angle(global_rotation,angle,delta*rotation_speed)

	pass
