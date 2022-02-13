extends KinematicBody2D

const speed = 60
const gravity = 10
const Jump_power = -250
const Floor = Vector2(0, -1)

var velocity = Vector2()

func _physics_process(delta):
	
	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -speed
	else:
		velocity.x = 0
	
	if Input.is_action_pressed("ui_up"):
		velocity.y = Jump_power
		
	velocity.y = velocity.y + gravity
	velocity = move_and_slide(velocity, Floor)

func _input(event):
	if event.is_action_pressed("Inventory"):
		Inventory.display()
