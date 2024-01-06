extends Node2D

signal enemy_spawned(enemy_instance)
signal path_enemy_spawned(enemy_instance)

var enemy_scene = preload('res://scenes/enemy.tscn')
var path_enemy = preload('res://scenes/path_enemy.tscn')
@onready var timer = $Timer
@onready var spawn_positions = $SpawnPositions

func _ready():
	timer.connect('timeout', _on_timer_timeout)
	
func _on_timer_timeout():
	spawn_enemy()
	
func _on_timer_2_timeout():
	spawn_path_enemy()

func spawn_enemy():
	var positions_arr = spawn_positions.get_children()
	var random_spawn_position = positions_arr.pick_random()
	var enemy_instance = enemy_scene.instantiate()
	enemy_instance.global_position = random_spawn_position.position
	emit_signal('enemy_spawned', enemy_instance)
	
func spawn_path_enemy():
	var path_enemy_instance = path_enemy.instantiate()
	emit_signal('path_enemy_spawned', path_enemy_instance)


