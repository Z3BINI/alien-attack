extends Area2D

@export var SPEED = 500

func _physics_process(delta):
	global_position.x += SPEED * delta

func _on_visible_notifier_screen_exited():
	queue_free()


func _on_area_entered(area):
	queue_free()
	area.die()
