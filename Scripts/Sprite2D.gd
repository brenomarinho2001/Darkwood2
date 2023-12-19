extends Sprite2D

var estado = 'sumir'
func _ready():
	modulate.a = 0
	


func _process(delta):
	
	if estado == 'aparecer':
		modulate.a = lerpf(modulate.a,1,.1)
	if estado == 'sumir':
		modulate.a = lerpf(modulate.a,0,.1)

func _on_area_sumir_body_entered(body):
	if body.is_in_group('Player'):
		estado = 'sumir'


func _on_area_aparecer_body_entered(body):
	if body.is_in_group('Player'):
		estado = 'aparecer'

