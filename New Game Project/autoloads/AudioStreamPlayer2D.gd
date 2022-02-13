extends AudioStreamPlayer

# * ... Learned to code this thanks to this awesome tutorial
# - https://www.youtube.com/watch?v=rKuTuAeKprE

func remove_self():
	queue_free()

# * ... Comment vous expliquez que vous volez...
func hack_the_planet(sound_stream):
	# * ... Une voiture ?
	set_stream(sound_stream)
	# * ... Une Ford Fiesta ?
	connect("finished", self, "remove_self")
	# * ... Han ouais !
	play()
