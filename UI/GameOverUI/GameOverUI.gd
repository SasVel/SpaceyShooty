extends Control

@onready var gameOverLabel = $GameOverLabel

func _ready():
	gameOverLabel.visible = false
	PlayerStats.no_health.connect(on_no_health)

func on_no_health():
	get_tree().paused = true
	gameOverLabel.visible = true
