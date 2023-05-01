extends Node2D

@onready var Enemy = preload("res://Enemies/Enemy.tscn")
@onready var rng = RandomNumberGenerator.new()
@onready var spawnTimer = $SpawnTimer
@onready var spawnRateIncreaseTimer = $SpawnRateIncreaseTimer

func _on_timer_timeout():
	var newEnemy = Enemy.instantiate()
	var randPos = rng.randi_range(0, 320)
	newEnemy.position = Vector2(randPos, -10)
	newEnemy.global_rotation = 3.141
	get_tree().get_root().add_child(newEnemy)


func _on_spawn_rate_increase_timer_timeout():
	if spawnTimer.wait_time > 0.1:
		spawnTimer.wait_time -= 0.05
	else:
		spawnRateIncreaseTimer.one_shot = true
