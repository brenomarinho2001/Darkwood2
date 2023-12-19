extends Sprite2D

var aparece = -1
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if aparece == -1:
		modulate.a = lerpf(modulate.a,0,.05)
	else:
		modulate.a = lerpf(modulate.a,1,.05)
	



func _on_area_2d_body_entered(body):
	if body.is_in_group('Player'):
		aparece *= -1
	pass # Replace with function body.
