extends Control

@onready var healthBar = $HealthBar

func _ready():
	healthBar.max_value = PlayerStats.max_health
	healthBar.value = PlayerStats.health

func _process(_delta):
	healthBar.value = PlayerStats.health
	print(PlayerStats.health)

