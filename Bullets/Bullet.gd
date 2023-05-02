extends Node2D

@export var bullet_speed = 260
@onready var DeathEffect = preload("res://Effects/ShootPop/ShootPop.tscn")

func _process(delta):
	position.y -= bullet_speed * delta
	
	if self.position.y < 0:
		queue_free()

func _on_hit_box_area_entered(_area):
	death_effect()
	queue_free()

func death_effect():
	var deathEffect = DeathEffect.instantiate()
	deathEffect.global_position = self.global_position + Vector2(0, 2)
	get_tree().get_root().add_child(deathEffect)
