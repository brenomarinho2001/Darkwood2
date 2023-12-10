extends Node


func save_to(path):
	var img = target_viewport.get_texture().get_data()
	img.flip_y()
	return img.save_png(path)


func _on_ButtonSave_pressed():
	save_to("res://captures/noise_"+ str( OS.get_system_time_msecs() ) +".png")


func _on_HSliderSeed_value_changed(value):
	noise.seed = value


func _on_HSliderOctaves_value_changed(value):
	noise.octaves = value


func _on_HSliderPeriod_value_changed(value):
	noise.period = value


func _on_HSliderPersistence_value_changed(value):
	noise.persistence = value


func _on_HSliderLacunarity_value_changed(value):
	noise.lacunarity = value
