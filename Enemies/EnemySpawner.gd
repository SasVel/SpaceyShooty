extends Node2D

@onready var Enemy = preload("res://Enemies/Enemy.tscn")
@onready var rng = RandomNumberGenerator.new()

func _on_timer_timeout():
	var newEnemy = Enemy.instantiate()
	var randPos = rng.randi_range(0, 320)
	newEnemy.position = Vector2(randPos, -10)
	newEnemy.global_rotation = 3.141
	var enemyFolder = get_tree().get_root().get_child(0).get_child(2)
	enemyFolder.add_child(newEnemy)
