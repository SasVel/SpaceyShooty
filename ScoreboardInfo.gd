extends Node2D

@onready var score = 0;

func _on_timer_timeout():
	score += 10
