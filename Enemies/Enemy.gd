extends CharacterBody2D

@export var speed = 280
@onready var direction = Vector2(0, 1)

func _physics_process(delta):
	velocity = direction * (speed * delta) * 10
	move_and_slide()


func _on_hurt_box_body_entered(_body):
	queue_free()
