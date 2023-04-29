extends Control

@onready var ScoreDisplay = $ScoreDisplay

func _process(_delta):
	ScoreDisplay.text = str(ScoreboardInfo.score)
