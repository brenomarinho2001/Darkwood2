extends Sprite2D

var dir_x = randf_range(-.01,.01) 
var dir_y = randf_range(-.01,.01) 
var speed = 200

func _ready():
	visible = false
	$Timer.start()
	randomize()
	z_index = -1
	modulate.a = randf_range(.1,.2)
	scale.x = randf_range(.1,.3)
	scale.y = randf_range(.1,.3)

func _process(_delta):
	scale.x += .02
	scale.y += .02
	modulate.a -= .001
	rotation_degrees += .1
	position.x += dir_x * speed/2
	position.y += dir_y * speed/2
	pass
	
	

func excluir():
	queue_free()


func _on_timer_timeout():
	visible = true
	$AnimationPlayer.play("fumaca")
	pass # Replace with function body.
