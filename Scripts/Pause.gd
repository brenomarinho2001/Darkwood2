extends CanvasLayer

var master_bus = AudioServer.get_bus_index("Master")
func _ready():
	Global.volume = $VBoxContainer/HSlider.value
	

func _process(_delta):
	#print(Global.interact)
	Global.volume = $VBoxContainer/HSlider.value
	if Input.is_action_just_pressed("ui_esc") and Global.interact == false:
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



func _on_h_slider_value_changed(value):
	AudioServer.set_bus_volume_db(master_bus,value)
	
	if value == -30:
		AudioServer.set_bus_mute(master_bus,true)
	else:
		AudioServer.set_bus_mute(master_bus,false)
	pass # Replace with function body.
	pass # Replace with function body.
