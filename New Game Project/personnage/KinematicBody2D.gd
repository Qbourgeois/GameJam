extends KinematicBody2D

const walk_speed = 70
const run_speed = 140
const gravity = 10
const Jump_power = -450
const Floor = Vector2(0, -1)
const PROJECTILES = preload("res://Scenes/CommonProps/projectiles.tscn")

var velocity = Vector2()
var on_ground = false
var jump_count = 0
var moving_state = "walk"
var speed = walk_speed

var isDead = false

func dead():
	isDead  = true
	velocity = Vector2(0, 0)
	$Timer.start()

func _physics_process(delta):
	if get_parent().name == "SnowScene":
		#print("game pos : ", get_parent().position.y)
		#print("player pos : ", self.position.y)
		if self.position.y > 1800:
			get_tree().change_scene("res://Scenes/TitleScreen/SplashScreen/GameOver.tscn")
	elif get_parent().name == "Node2D":
		if self.position.y > 600:
			get_tree().change_scene("res://Scenes/TitleScreen/SplashScreen/GameOver.tscn")

	if isDead == false:
		$AnimatedSprite.frames.set_animation_loop("jump", false)
		$AnimatedSprite.frames.set_animation_loop("db_jump", false)
		if Input.is_action_pressed("ui_control"):
			if on_ground:
				moving_state = "run"
			speed = run_speed
		else:
			if on_ground:
				moving_state = "walk"
			speed = walk_speed

		if Input.is_action_pressed("ui_right"):
			$AnimatedSprite.flip_h = false
			velocity.x = speed
			if on_ground == true:
				$AnimatedSprite.play(moving_state)
		elif Input.is_action_pressed("ui_left"):
			$AnimatedSprite.flip_h = true
			if on_ground == true:
				$AnimatedSprite.play(moving_state)
			velocity.x = -speed
		else:
			velocity.x = 0
			if on_ground == true:
				moving_state = "idl"
				$AnimatedSprite.play(moving_state)
				
		if Input.is_action_just_pressed("ui_focus_next"):
			var proj = PROJECTILES.instance()
			get_parent().add_child(proj)
			#proj.position = $Position2D.global_position
			if $AnimatedSprite.flip_h == false:
				proj.set_proj_dir(1)
			else:
				proj.set_proj_dir(-1)
			proj.position.x = self.position.x - 100 if $AnimatedSprite.flip_h == true else self.position.x + 7
			proj.position.y = self.position.y
			print(proj.position)
		
		velocity.y = velocity.y + gravity
		
		if is_on_floor():
			on_ground = true
			jump_count = 0
		else:
			on_ground = false
			if velocity.y < 0:
				$AnimatedSprite.play("jump")
			else:
				$AnimatedSprite.play("db_jump")
		velocity = move_and_slide(velocity, Floor)
		
		if get_slide_count() > 0:
			for i in range(get_slide_count()):
				if "Enemy" in get_slide_collision(i).collider.name:
					dead()

func _input(event):
	if event.is_action_pressed("Inventory"):
		Inventory.display()
	if Input.is_action_pressed("ui_up"):
		if on_ground:
			jump_count += 1
			velocity.y = Jump_power
		elif jump_count < 1:
			jump_count += 1
			velocity.y = Jump_power


func _on_Timer_timeout():
	get_tree().change_scene("res://Scenes/TitleScreen/SplashScreen/GameOver.tscn")


#func _on_VisibilityNotifier2D_screen_exited():
#	get_tree().change_scene("res://Scenes/TitleScreen/SplashScreen/GameOver.tscn")


#func _on_VisibilityNotifier2D_screen_exited():
#	get_tree().change_scene("res://Scenes/TitleScreen/SplashScreen/GameOver.tscn")


func _on_Area2D_body_exited(body):
	if body.name == 'Player' or body.name == 'KineticBody2D':
		get_tree().change_scene("res://Scenes/TitleScreen/SplashScreen/GameOver.tscn")
