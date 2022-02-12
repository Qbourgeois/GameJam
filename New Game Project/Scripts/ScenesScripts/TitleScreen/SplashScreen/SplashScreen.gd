extends Node2D

func initialize():
	$Background/ColorRect.set_size(get_viewport_rect().size)
	$Logo/Sprite.position = get_viewport_rect().size/2
	$Logo/Sprite.modulate.a = 0.0

func _ready():
	initialize()
	yield(get_tree().create_timer(2.0), "timeout")
	$AnimationPlayer.play("fadeIn")
	yield(get_node("AnimationPlayer"), "animation_finished")
	$AnimationPlayer.play("fadeOut")
	yield(get_node("AnimationPlayer"), "animation_finished")
	queue_free()
	get_tree().change_scene("res://Scenes/TitleScreen/FirstScreen.tscn")
