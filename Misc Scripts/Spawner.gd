extends Node2D

@export var Entity : Resource
@onready var rng = RandomNumberGenerator.new()
@onready var spawnTimer = $SpawnTimer
@onready var spawnRateIncreaseTimer = $SpawnRateIncreaseTimer

func _on_timer_timeout():
	var newEntity = Entity.instantiate()
	var randPos = rng.randi_range(0, 320)
	newEntity.position = Vector2(randPos, -10)
	newEntity.global_rotation = 3.141
	get_tree().get_root().add_child(newEntity)


func _on_spawn_rate_increase_timer_timeout():
	if spawnTimer.wait_time > 0.1:
		spawnTimer.wait_time -= 0.05
	else:
		spawnRateIncreaseTimer.one_shot = true