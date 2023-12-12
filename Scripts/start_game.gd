extends Control


var estados = 'comecar'

func _process(_delta):
	
	match estados:
		
		'comecar':
			
			$VBoxContainer/Comecar.text = '>Começar'
			$VBoxContainer/Opcoes.text = 'Opcoes'
			$VBoxContainer/Creditos.text = 'Creditos'
			if Input.is_action_just_pressed("ui_up"):
				estados = 'creditos'
			
			if Input.is_action_just_pressed("ui_down"):
				estados = 'opcoes'
			
			if Input.is_action_just_pressed("ui_accept"):
				get_tree().change_scene_to_file("res://Scenes/world.tscn")
			
			pass
		
		'opcoes':
			
			if Input.is_action_just_pressed("ui_up"):
				estados = 'comecar'
			
			if Input.is_action_just_pressed("ui_down"):
				estados = 'creditos'
			
			if Input.is_action_just_pressed("ui_accept"):
				get_tree().change_scene_to_file("res://Scenes/Opcoes.tscn")
				pass
			
			$VBoxContainer/Comecar.text = 'Começar'
			$VBoxContainer/Opcoes.text = '>Opcoes'
			$VBoxContainer/Creditos.text = 'Creditos'
			pass
			
		'creditos':
			
			if Input.is_action_just_pressed("ui_accept"):
				get_tree().change_scene_to_file("res://Scenes/Creditos.tscn")
				pass
			
			if Input.is_action_just_pressed("ui_up"):
				estados = 'opcoes'
			
			if Input.is_action_just_pressed("ui_down"):
				estados = 'comecar'
			
			$VBoxContainer/Comecar.text = 'Começar'
			$VBoxContainer/Opcoes.text = 'Opcoes'
			$VBoxContainer/Creditos.text = '>Creditos'
			pass
