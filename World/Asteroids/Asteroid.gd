extends CharacterBody2D

@export var speed = 280
@export var scoreOnDeath = 100
@export var explosionStrength = 3
@onready var direction = Vector2(0, 1)

@onready var stats = $Stats
@onready var DeathEffect = preload("res://Effects/Explosion_1/Explosion_1.tscn")
@onready var explosionCollision = $ExplosionHitBox

func _physics_process(delta):
	#velocity = direction * (speed * delta) * 10
	self.rotation += -0.01
	move_and_slide()
	
func _on_hurt_box_area_entered(area):
	stats.health -= area.damage

func _on_stats_no_health():
#	var entitiesColliding = explosionCollision.get_overlapping_bodies()
#	for e in entitiesColliding:
#		e.get_child(0).health -= explosionStrength
	create_death_explosion()
	queue_free()

func create_death_explosion():
	var deathEffect = DeathEffect.instantiate()
	deathEffect.global_position = self.global_position
	get_tree().get_root().add_child(deathEffect)

