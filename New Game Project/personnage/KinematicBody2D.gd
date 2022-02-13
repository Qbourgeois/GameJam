extends KinematicBody2D

const speed = 70
const gravity = 10
const Jump_power = -450
const Floor = Vector2(0, -1)

var velocity = Vector2()
var on_ground = false

func _physics_process(delta):
	
	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
		$AnimatedSprite.play("run")
	elif Input.is_action_pressed("ui_left"):
		$AnimatedSprite.play("run")
		velocity.x = -speed
	else:
		velocity.x = 0
		if on_ground == true:
			$AnimatedSprite.play("idl")
	
	if Input.is_action_pressed("ui_up"):
		if on_ground == true:
			velocity.y = Jump_power
	
	velocity.y = velocity.y + gravity
	
	if is_on_floor():
		on_ground = true
	else:
		on_ground = false
	velocity = move_and_slide(velocity, Floor)

func _input(event):
	if event.is_action_pressed("Inventory"):
		Inventory.display()
