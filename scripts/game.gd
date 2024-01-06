extends Node2D

var lives = 3
var score = 0
var game_over_scene = preload('res://scenes/game_over_screen.tscn')
@onready var player = $Player
@onready var hud = $UI/HUD
@onready var enemy_hit_sound = $EnemyHitSound
@onready var enemy_explode_sound = $EnemyExplodeSound

func _ready():
	hud.set_score_label(score)
	hud.set_lives(lives)

func _on_deathzone_area_entered(area):
	area.queue_free()
	enemy_explode_sound.play()

func _on_player_took_damage():
	lives -= 1
	hud.set_lives(lives)
	if lives == 0:
		var game_over_inst = game_over_scene.instantiate()
		player.die()
		await get_tree().create_timer(1.5).timeout 
		game_over_inst.set_score(score)
		$UI.add_child(game_over_inst)
		
	
func _on_enemy_spawner_enemy_spawned(enemy_instance):
	enemy_instance.connect('died', _on_enemy_died)
	add_child(enemy_instance)

func _on_enemy_died():
	enemy_hit_sound.play()
	score += 10
	hud.set_score_label(score)
