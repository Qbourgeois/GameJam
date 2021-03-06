extends ParallaxBackground

# * ... Random titlescreen

var tex_a2 = preload("res://ressources/Graphics/TitleScreen/Menu/titlescreenBackground2.png")
var tex_b2 = preload("res://ressources/Graphics/TitleScreen/Menu/titlescreenSprite2.png")

func _ready():
	randomize()
	var tex_id = randi() % 2 + 1
	if tex_id == 2:
		$ParallaxLayer/Sprite.set_texture(tex_a2)
		$ParallaxLayer2/Sprite.set_texture(tex_b2)


func _on_Button_pressed():
	SoundController.play("menu_confirm.wav")
	get_tree().change_scene("res://Scenes/TitleScreen/Menu.tscn")


func _on_ReturnMenu_pressed():
	SoundController.play("menu_confirm.wav")
	get_tree().change_scene("res://Scenes/TitleScreen/Menu.tscn")
