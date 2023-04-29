extends Node2D

@export var bullet_speed = 260
func _process(delta):
	position.y -= bullet_speed * delta
	
	if self.position.y < 0:
		queue_free()

func _on_hit_box_area_entered(_area):
	queue_free()
