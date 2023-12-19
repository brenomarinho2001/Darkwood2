extends Node2D


var i = 0
var entrou = false
var pausado = false
var comecou_desafio = false

var n_para_ganhar = 4

func _ready():
	$Portal.visible = false
	hides()
	n_para_ganhar = int(randi_range(3,6))

	

func hides():
	visible = false

func shows():
	visible = true

func _process(delta):
	
	i = $Seta.frame
	
	if entrou and Input.is_action_just_pressed("ui_shift"):
		shows()
		_pausar()
		comecou_desafio = true
		$Seta.frame = int(randi_range(0,3))
		n_para_ganhar = int(randi_range(3,6))
		
	if comecou_desafio:
		match i:
				
				0:
					ganhar_ou_perder('ui_up')
				1:
					ganhar_ou_perder('ui_right')
				2:
					ganhar_ou_perder('ui_down')
				3:
					ganhar_ou_perder('ui_left')

func ganhar_ou_perder(b):
	
	match b:
		
		'ui_up':
			if Input.is_action_just_pressed(b):
				hides_and_random()
			if Input.is_action_just_pressed('ui_left') or Input.is_action_just_pressed('ui_right') or Input.is_action_just_pressed('ui_down'):
				perdendo_o_jogo()
		
		'ui_down':
			if Input.is_action_just_pressed(b):
				hides_and_random()
			if Input.is_action_just_pressed('ui_left') or Input.is_action_just_pressed('ui_right') or Input.is_action_just_pressed('ui_up'):
				perdendo_o_jogo()
		
		'ui_right':
			if Input.is_action_just_pressed(b):
				hides_and_random()
			if Input.is_action_just_pressed('ui_left') or Input.is_action_just_pressed('ui_down') or Input.is_action_just_pressed('ui_up'):
				perdendo_o_jogo()
		'ui_left':
			if Input.is_action_just_pressed(b):
				hides_and_random()
			if Input.is_action_just_pressed('ui_down') or Input.is_action_just_pressed('ui_right') or Input.is_action_just_pressed('ui_up'):
				perdendo_o_jogo()
	
	pass

func hides_and_random():
	n_para_ganhar -=1
	
	if n_para_ganhar <= 0:
		ganhou()
		get_tree().paused = false
	
	var n_antigo = $Seta.frame
	if n_para_ganhar > 0:
		$Seta.frame = int(randi_range(0,3))
		while n_antigo == $Seta.frame:
			$Seta.frame = int(randi_range(0,3))
func ganhou():
	$Portal.visible = true
	$Portal/AnimationPlayer.play("mascara")

func perdendo_o_jogo():
	hides()
	visible = false

	comecou_desafio = false
	get_tree().paused = false

	pass

func excluir():
	get_parent().queue_free()





func _pausar():
	get_tree().paused = true
	pass


func _on_area_2d_body_entered(body):
	if body.is_in_group('Player'):
		entrou = true
	pass # Replace with function body.


func _on_area_2d_body_exited(body):
	if body.is_in_group('Player'):
		entrou = false
	pass # Replace with function body.
