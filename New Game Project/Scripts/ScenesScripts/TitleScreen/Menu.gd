extends Control

func initialize():
	$ParallaxBackground/ParallaxLayer/Sprite.position.y = get_viewport().size.y / 2
	$ParallaxBackground/ParallaxLayer2/Sprite.position.y = get_viewport().size.y / 2
	$VBoxContainer/StartButton.grab_focus()

func _ready():
	initialize()

func _on_StartButton_pressed():
	get_tree().change_scene("res://Scenes/TitleScreen/DummyScene.tscn")

func _on_CreditButton_pressed():
	get_tree().change_scene("res://Scenes/TitleScreen/DummyScene2.tscn")

func _on_QuitButton_pressed():
	get_tree().quit()
