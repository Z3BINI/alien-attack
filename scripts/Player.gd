extends CharacterBody2D

var SPEED = 250

func _physics_process(delta):
	velocity = Vector2(0, 0)
	
	if Input.is_action_pressed('right'):
		velocity.x = SPEED
	if Input.is_action_pressed('left'):
		velocity.x = -SPEED
	if Input.is_action_pressed('up'):
		velocity.y = -SPEED
	if Input.is_action_pressed('down'):
		velocity.y = SPEED
	
	move_and_slide()
