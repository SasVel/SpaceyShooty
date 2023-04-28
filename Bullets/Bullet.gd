extends Node2D

@export var bullet_speed = 260
func _process(delta):
	position.y -= bullet_speed * delta
