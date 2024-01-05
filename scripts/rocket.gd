extends Area2D

@export var SPEED = 500

func _physics_process(delta):
	global_position.x += SPEED * delta
