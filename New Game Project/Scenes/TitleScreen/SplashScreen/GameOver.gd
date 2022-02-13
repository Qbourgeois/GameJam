extends Control


func _on_Return_pressed():
	SoundController.play("menu_confirm.wav")
	get_tree().change_scene("res://Scenes/TitleScreen/Menu.tscn")
