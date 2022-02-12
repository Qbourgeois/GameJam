extends Control

func _input(event):
	if (event is InputEventKey):
		get_tree().change_scene("res://Scenes/TitleScreen/TitleScreenMenu.tscn")

func _ready():
	MusicController.play("titleScreen.ogg")
	MusicController.setVolume(1)
