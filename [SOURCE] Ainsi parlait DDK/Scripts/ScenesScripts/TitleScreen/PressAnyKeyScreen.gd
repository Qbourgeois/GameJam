extends Control

func _input(event):
	if (event is InputEventKey):
		get_tree().change_scene("res://Scenes/TitleScreen/Menu.tscn")

func _ready():
	preload("res://Scenes/TitleScreen/Menu.tscn")
	MusicController.play("titleScreen.ogg")
