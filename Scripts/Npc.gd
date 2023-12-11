extends CharacterBody2D

var entrou = false



var fala = [
	{
		'name':'Gabriel',
		'dialogo':'Olá tudo bom?',
		'img':'',
	},
	{
		'name':'Gabriel',
		'dialogo':'eu sou gabriel e sou novo no laboratorio',
		'img':'',
	}
]

var i = 0
var falar = true

func _ready():
	$CanvasLayer.visible = false
	$CanvasLayer/Label.text = ''
	$CanvasLayer/Label.visible_characters = 0

func _process(_delta):
	print($CanvasLayer/Label.visible_characters)
	if entrou and Input.is_action_just_pressed("ui_accept"):
		get_tree().paused = true
		$CanvasLayer/Label.visible_characters = 0
		$CanvasLayer.visible = true
		if falar:
			#$CanvasLayer/Label.visible_characters +=1
			$CanvasLayer/Name.text = fala[i].name
			$CanvasLayer/Label.text = fala[i].dialogo
			print(fala[i].dialogo)
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
