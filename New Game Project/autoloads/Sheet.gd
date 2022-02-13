extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Inventory.discard()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func display():
	$CanvasLayer.get_child(0).show()
	$CanvasLayer/NinePatchRect/Exit.grab_focus()
	Inventory.show()

func discard():
	$CanvasLayer.get_child(0).hide()
	Inventory.hide()

func _on_Exit_pressed():
	Inventory.discard()
