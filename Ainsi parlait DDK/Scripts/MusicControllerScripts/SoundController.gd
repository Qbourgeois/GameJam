extends Node

# * ... Et pourquoi vous n'avez pas dormi de la nuit ?
func play(filename: String, volume_db: float = 1.0) -> void:
	# * ... Parce que j'ai du mal à dormir
	var informagicien = load("res://ressources/Audio/SE/" + filename)
	# * ... Depuis quand vous ne vous droguez plus ?
	var hackInTheMatrix = load("res://autoloads/SoundController.tscn").instance()
	# * ... Ca fait longtemps
	add_child(hackInTheMatrix)
	# * ... Ca fait longtemps
	hackInTheMatrix.get_child(0).set_volume_db(volume_db)
	# * ... Et bah on dirait pas
	hackInTheMatrix.get_child(0).hack_the_planet(informagicien)
