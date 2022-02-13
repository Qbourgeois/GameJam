extends Area2D

export(String, FILE, "*.tscn") var target_stage

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _on_Area2D_body_entered(body):
	if "Player" in body.name or "KinematicBody2D" in body.name:
		get_tree().change_scene(target_stage)
	
