extends Control

var tgAuDebut = true

func initialize():
	$ParallaxBackground/ParallaxLayer/Sprite.position.y = get_viewport().size.y / 2
	$ParallaxBackground/ParallaxLayer2/Sprite.position.y = get_viewport().size.y / 2
	$StartButton.grab_focus()

func _ready():
	preload("res://Scenes/TitleScreen/ControlScene.tscn")
	initialize()

func _on_StartButton_pressed():
	SoundController.play("menu_confirm.wav")
	get_tree().change_scene("res://Scenes/Level00/Level.tscn")

func _on_ControlButton_pressed():
	SoundController.play("menu_confirm.wav")
	get_tree().change_scene("res://Scenes/TitleScreen/ControlScene.tscn")

func _on_QuitButton_pressed():
	SoundController.play("menu_confirm.wav")
	get_tree().quit()

func _on_StartButton_focus_entered():
	if !tgAuDebut:
		SoundController.play("menu_cursor.wav")
	else:
		tgAuDebut = false

func _on_QuitButton_focus_entered():
	SoundController.play("menu_cursor.wav")


func _on_HSlider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), value)
