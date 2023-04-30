extends CharacterBody2D

@export var speed = 280
@export var scoreOnDeath = 100
@onready var direction = Vector2(0, 1)

@onready var stats = $Stats 

func _physics_process(delta):
	velocity = direction * (speed * delta) * 10
	move_and_slide()

func _on_hurt_box_area_entered(area):
	stats.health -= area.damage 
	
func _on_stats_no_health():
	ScoreboardInfo.score += scoreOnDeath
	PlayerStats.enemiesKilled += 1
	queue_free()



