extends Control

@onready var pauseLabel = $PauseLabel
@onready var escLabel = $EscLabel

func _ready():
	pauseLabel.visible = false
	escLabel.visible = false

func _process(_delta):
	if Input.is_action_just_pressed("pause") && get_tree().paused == false:
			pauseLabel.visible = true
			escLabel.visible = true
			get_tree().paused = true
	elif Input.is_action_just_pressed("pause") && get_tree().paused == true:
			pauseLabel.visible = false
			escLabel.visible = false
			get_tree().paused = false
		
