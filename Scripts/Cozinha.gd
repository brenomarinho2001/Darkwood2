extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Global.player_correndo == true:
		material.set_shader_parameter( 'dir', Vector2(0.002,0.002) )
	else:
		material.set_shader_parameter( 'dir', Vector2(0,0) )
	pass
