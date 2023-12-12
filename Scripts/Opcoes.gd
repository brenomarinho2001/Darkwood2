extends Control

var master_bus = AudioServer.get_bus_index("Master")

func _ready():
	
	$HSlider.value = Global.volume
	

func _process(_delta):
	
	Global.volume = $HSlider.value
	
	
	
	if Input.is_action_just_pressed("ui_esc"):
		get_tree().change_scene_to_file("res://Scenes/start_game.tscn")
	pass


func _on_h_slider_value_changed(value):
	AudioServer.set_bus_volume_db(master_bus,value)
	
	if value == -30:
		AudioServer.set_bus_mute(master_bus,true)
	else:
		AudioServer.set_bus_mute(master_bus,false)
	pass # Replace with function body.
