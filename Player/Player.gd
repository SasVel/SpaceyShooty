extends CharacterBody2D

@export var SPEED = 500;
@export var MAX_SPEED = 1500;
@export var ACCELERATION = 60;
@export var FRICTION = 30;
var CURR_SPEED = SPEED

@onready var input_direction = Vector2.ZERO
@onready var input_vector = Vector2.ZERO
@onready var Bullet = preload("res://Bullets/Bullet.tscn")
@onready var cooldownTimer = $ShootCooldown
var shootOnCooldown = false

func _ready():
	PlayerStats.no_health.connect(_on_player_stats_no_health)	

func _physics_process(delta):
	input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	if input_direction != Vector2.ZERO:
		if input_direction.y < 0:
			input_vector = input_direction * ((SPEED * 0.6) * delta) * 10
		elif input_direction.y > 0:
			input_vector = input_direction * ((SPEED * 1.3) * delta) * 10
		else:
			input_vector = input_direction * (SPEED * delta) * 10
		velocity = input_vector
	else:
		velocity = velocity.move_toward(Vector2.ZERO, (FRICTION * delta) * 8)
	
	shoot_bullet()
	move_and_slide()

func shoot_bullet():
	var shoot_input = Input.is_action_pressed("shoot")

	if	shoot_input && shootOnCooldown == false:
		cooldownTimer.start()
		shootOnCooldown = true
		var new_bullet = Bullet.instantiate()
		new_bullet.global_position = self.global_position + Vector2(0, -12)
		get_tree().get_root().add_child(new_bullet)
				
func _on_shoot_cooldown_timeout():
	shootOnCooldown = false
	
func _on_hurt_box_area_entered(area):
	PlayerStats.health -= area.damage
	
func _on_player_stats_no_health():
	get_tree().paused = true
	queue_free()


