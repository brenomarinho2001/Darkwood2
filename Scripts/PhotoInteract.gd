extends Area2D

var entrou = false
@export var img = ''
var tocou = false
func _ready():
	$Botao.visible = false

	$CanvasLayer/Sprite2D.texture = load(img)
	$CanvasLayer/Sprite2D.visible = false
	
	pass

func _process(_delta):
	
	if entrou and tocou == false:
		$Botao.visible = true
	else:
		$Botao.visible = false

	
	if entrou and Input.is_action_just_pressed("ui_e") :
		
		

		if tocou == false:
			$CanvasLayer/AnimationPlayer.play("fade")
			tocou = true
		
		$Botao.visible = true
		Global.interact = true
	elif Input.is_action_just_pressed("ui_esc"):
		$CanvasLayer/Sprite2D.visible = false

		$Botao.visible = false

func _on_body_entered(body):
	if body.is_in_group("Player"):
		entrou = true


func _on_body_exited(body):
	if body.is_in_group("Player"):
		entrou = false
		tocou = false
		Global.interact = false

