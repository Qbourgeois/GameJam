extends Node

func play(filename: String, volume_db: float = 1.0) -> void:
	var music = load("res://ressources/Audio/BGM/" + filename)
	$Music.stream = music
	$Music.set_volume_db(volume_db)
	$Music.play()

func setVolume(volume_db: float) -> void:
	$Music.set_volume_db(volume_db)
