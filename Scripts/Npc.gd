extends CharacterBody2D

var entrou = false
@export var interagivel = false
@export var respirando = false
@export var squash = false
@export var dialogo = false
@export var fala = [
	{
		'name':'Gabriel',
		'dialogo':'Ah não.. o Gonçales usou as peças da maquina do tempo cara..',
		'img':'',
	},
	{
		'name':'Gabriel',
		'dialogo':'isso deve ter bagunçado tudo...',
		'img':'',
	},
	{
		'name':'Gabriel',
		'dialogo':'preciso encontrar uma saida, mas antes é melhor levar o microondas já que ele é uma maquina do tempo.',
		'img':'',
	}
]

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
		if (entrou and Input.is_action_just_pressed("ui_e")) or dialogo:
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
			if i < fala.size()-1:
				i+=1
				
			else:
				falar = false
				#$Label.text = ''	
		elif $CanvasLayer.visible == true and $CanvasLayer/Label.visible_characters < 100:
			$CanvasLayer/Label.visible_characters +=1


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
