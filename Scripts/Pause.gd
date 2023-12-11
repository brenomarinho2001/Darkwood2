extends CanvasLayer



func _process(_delta):

	if Input.is_action_just_pressed("ui_esc"):
		Global.pause *= -1
	
	if Global.pause == 1:
		visible = true
		get_tree().paused = true
		pass
	else:
		visible = false
		get_tree().paused =false
		pass
	
	pass
