extends KinematicBody2D

const Gravity = 10
const Speed = 60
const Floor = Vector2(0, -1)

var velocity = Vector2()
var dir = 1

func _ready():
	pass

func _physics_process(delta):
	velocity.x = Speed * dir 

	if dir == 1:
		$AnimatedSprite.flip_h = false
	else:
		$AnimatedSprite.flip_h = true
	$AnimatedSprite.play("Walk")
	velocity.y = 0
	
	velocity = move_and_slide(velocity, Floor)
	
	if is_on_wall():
		dir = dir * -1
	
	velocity = move_and_slide(velocity, Floor)
