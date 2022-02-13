extends AudioStreamPlayer

# * ... Learned to code this thanks to this awesome tutorial
# - https://www.youtube.com/watch?v=rKuTuAeKprE

# * ... Des hamburgers
func kill_me():
	queue_free() # * ... Des pains au chocolat

# * ... Comment vous expliquez que vous volez...
func hack_the_planet(sound_stream):
	# * ... Une voiture ?
	set_stream(sound_stream)
	# * ... Une Ford Fiesta ?
	connect("finished", self, "kill_me")
	# * ... Han ouais !
	play()
