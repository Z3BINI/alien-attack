extends CharacterBody2D

var SPEED = 250

func _physics_process(delta):
	velocity = Vector2.ZERO
	
	if Input.is_action_pressed('right'):
		velocity.x = SPEED
	if Input.is_action_pressed('left'):
		velocity.x = -SPEED
	if Input.is_action_pressed('up'):
		velocity.y = -SPEED
	if Input.is_action_pressed('down'):
		velocity.y = SPEED
	
	move_and_slide()
	
	# Constrict player to resolution size
	var screen_size = get_viewport_rect().size  # Get current screen resolution (Vector2)
	global_position = global_position.clamp(Vector2(0, 0), screen_size) 
	
