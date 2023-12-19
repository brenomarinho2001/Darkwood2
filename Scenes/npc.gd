extends CharacterBody2D

var entrou = false
@export var interagivel = false
@export var respirando = false
@export var squash = false
@export var fala = [
	{
		'name':'Prota',
		'dialogo':'Opa como se tá Gonçales?',
		'img':'',
	},
	{
		'name':'Gonçales',
		'dialogo':'tudo otimo tirando a praga de ratos, espero que aquele danadinho caia na ratoeira',
		'img':'',
	},
	{
		'name':'Prota',
		'dialogo':'e ce ta fazendo oq, o microondas quebrou?',
		'img':'',
	},
	{
		'name':'Gonçales',
		'dialogo':'mais ou menos to turbinando, to cansado de marmita fria',
		'img':'',
	},
	{
		'name':'Prota',
		'dialogo':'espera essas são as peças da ....',
		'img':'',
	},
]
@export var comecaja = false

var i = 0
var falar = true
@export var excluir = false
func _ready():
	

	
	if fala[i].name == '':
		$CanvasLayer/Name.visible = false
		$CanvasLayer/ColorRect2.visible = false
	
	if respirando:
		$AnimationPlayer.play("respirando")
	
	if squash:
		$AnimationPlayer.play("squash")
	
	$CanvasLayer.visible = false
	$CanvasLayer/Label.text = ''
	$CanvasLayer/Label.visible_characters = 0
	
	if !interagivel:
		$Botao.visible = false

func _process(_delta):
	
	if excluir:
		queue_free()
	
	if interagivel:
		
		if entrou and falar:
			$Botao.visible = true
		else:
			$Botao.visible = false

		
		#print($CanvasLayer/Label.visible_characters)
		if entrou and Input.is_action_just_pressed("ui_e"):
			interagivel = true
			$CanvasLayer/ColorRect.visible = true
			$CanvasLayer/ColorRect2.visible = true
			$CanvasLayer/Label.visible = true
			$CanvasLayer/Name.visible = true
			get_tree().paused = true
			$CanvasLayer/Label.visible_characters = 0
			$CanvasLayer.visible = true
			if falar:
				#$CanvasLayer/Label.visible_characters +=1
				$CanvasLayer/Name.text = fala[i].name
				$CanvasLayer/Label.text = fala[i].dialogo
				#print(fala[i].dialogo)
			else:
				
				$CanvasLayer/Label.text = ''	
				get_tree().paused = false
				$CanvasLayer/Name.text = ''
				$CanvasLayer.visible = false
				$AnimationPlayer2.play("explodir")
			if i < fala.size()-1:
				i+=1
				
			else:
				
				falar = false
				#$Label.text = ''	
		elif $CanvasLayer.visible == true and $CanvasLayer/Label.visible_characters < 100:
			$CanvasLayer/Label.visible_characters +=1


func _mudar():
	get_tree().change_scene_to_file("res://Scenes/world.tscn")

func _on_area_2d_body_entered(body):
	if body.is_in_group('Player'):
		entrou = true
	pass # Replace with function body.




func _on_area_2d_body_exited(body):
	if body.is_in_group('Player'):
		entrou = false
		falar = true
		$CanvasLayer/Label.visible_characters = 0
		i = 0
	pass # Replace with function body.
