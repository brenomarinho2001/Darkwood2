extends Control


var estados = 'breno'

func link(p):
		OS.shell_open(p)

func _process(delta):
	
	if Input.is_action_just_pressed("ui_esc"):
		get_tree().change_scene_to_file("res://Scenes/start_game.tscn")
	
	
	
	match estados:
		
		'breno':
			
			
			$VBoxContainer/Comecar.text = '>brenomarinho2001 ( programador )'
			$VBoxContainer/Opcoes.text = 'GUILHERME ( GAMEDESIGNER )'
			$VBoxContainer/Creditos.text = 'luís saraiva ( artista )'
			if Input.is_action_just_pressed("ui_accept"):
				link('https://www.instagram.com/brenomarinho2001/?next=%2F')
			
			if Input.is_action_just_pressed("ui_up"):
				estados = 'luis'
			
			if Input.is_action_just_pressed("ui_down"):
				estados = 'guilherme'
		'guilherme':
			
			$VBoxContainer/Comecar.text = 'brenomarinho2001 ( programador )'
			$VBoxContainer/Opcoes.text = '>GUILHERME ( GAMEDESIGNER )'
			$VBoxContainer/Creditos.text = 'luís saraiva ( artista )'
			
			if Input.is_action_just_pressed("ui_accept"):
				link('https://www.instagram.com/elege_fernandes/')
				pass
			
			if Input.is_action_just_pressed("ui_up"):
				estados = 'breno'
			
			if Input.is_action_just_pressed("ui_down"):
				estados = 'luis'
			
		'luis':
			$VBoxContainer/Comecar.text = 'brenomarinho2001 ( programador )'
			$VBoxContainer/Opcoes.text = 'GUILHERME ( GAMEDESIGNER )'
			$VBoxContainer/Creditos.text = '>luís saraiva ( artista )'
			
			if Input.is_action_just_pressed("ui_accept"):
				link('https://www.instagram.com/edu_sav/')
				pass
			
			if Input.is_action_just_pressed("ui_up"):
				estados = 'guilherme'
			
			if Input.is_action_just_pressed("ui_down"):
				estados = 'breno'
			
