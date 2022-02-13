extends Area2D

const SPEED = 100
var velocity = Vector2()
var dir = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func set_proj_dir(dirrect):
	dir = dirrect
	if dirrect == -1:
		$AnimatedSprite.flip_h = true
		
func _physics_process(delta):
	#move through the screen
	velocity.x = SPEED * delta * dir
	translate(velocity)
	#play the animation
	$AnimatedSprite.play("shoot")


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_projectiles_body_entered(body):
	if "Enemy" in body.name:
		body.dead()
	queue_free() # Replace with function body.
