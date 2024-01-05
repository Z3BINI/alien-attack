extends Area2D

@export var SPEED = 300

func _physics_process(delta):
	global_position.x -= SPEED * delta
	
func die():
	queue_free()
