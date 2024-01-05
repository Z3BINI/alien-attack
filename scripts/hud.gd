extends Control

@onready var score = $Score
@onready var life = $Life

func set_score_label(new_score):
	score.text = 'SCORE: ' + str(new_score)

func set_lives(amount):
	life.text = str(amount)
