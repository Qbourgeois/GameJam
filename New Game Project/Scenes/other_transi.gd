extends Node2D

var bubble_text = "DE QUEL DESERT EST ENTOURE LE GENIE"
var bubble_text_length = 0
var bubble_text_index = 0
var current_text = ""

onready var lbltext = get_node("VBoxContainer/Label")
onready var ninerect = get_node("VBoxContainer/Label/NinePatchRect")

onready var timer = get_node("Timer")

var do_close = false

func _ready():
	MusicController.setVolume(-10)
	SoundController.play("deuxieme_citation.wav")
	bubble_text_length = bubble_text.length()
	timer.start(1)

func _on_Timer_timeout():
	if (!do_close):
		current_text += bubble_text[bubble_text_index]
		lbltext.text = current_text
		
		if(bubble_text_index < bubble_text_length -1):
			timer.start(0.04)
			bubble_text_index += 1
		else:
			if(!do_close):
				do_close = true
				timer.start(1)
	else:
		if (bubble_text_length > 0):
			current_text.erase(bubble_text_length -1,1)
			lbltext.text = current_text
			bubble_text_length -= 1
			
			timer.start(0.04)
		else:
			MusicController.setVolume(1.0)
			get_tree().change_scene("res://Scenes/IceScene/SnowScene.tscn")
			queue_free()

