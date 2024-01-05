extends CharacterBody2D

var SPEED = 250
var rocket_scene = preload('res://scenes/rocket.tscn')
var rocket_container 

func _ready():
	rocket_container = get_node('RocketContainer')

func _process(delta):
	if Input.is_action_just_pressed('shoot'):
		shoot()

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
	
func shoot():
	var rocket_instance = rocket_scene.instantiate()
	rocket_container.add_child(rocket_instance)
	rocket_instance.global_position = global_position
	rocket_instance.global_position.x += 80
