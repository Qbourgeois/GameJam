extends Node

# * ... Je suis informagicien

func play(filename: String, volume_db: float = 1.0) -> void:
	var sound_stream = load("res://ressources/Audio/SE/" + filename)
	var hackInTheMatrix = load("res://autoloads/SoundController.tscn").instance()
	add_child(hackInTheMatrix)
	hackInTheMatrix.get_child(0).set_volume_db(volume_db)
	hackInTheMatrix.get_child(0).hack_the_planet(sound_stream)
