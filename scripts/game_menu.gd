extends Node2D

@onready var scoreLabel = $"ScoreLabel"
@onready var highScoreLabel = $"HighScoreLabel"
@onready var alertLabel = $"AlertLabel"
@onready var deco = $"Deco"

func start():
	var a = 1
	for i in range(0,11):
		deco.modulate = Color(1,1,1,a)
		highScoreLabel.modulate = Color(1,1,1,a)
		await get_tree().create_timer(.03).timeout
		a -= .1
	

func addScore(score):
	scoreLabel.text = str(score)

func updateHighScoreLabel(score):
	highScoreLabel.text = "High Score: " + str(score)

func alert(text):
	if !is_inside_tree():
		return

	
	alertLabel.text = text
	alertLabel.visible = true
	for i in range(0, 10):
		alertLabel.add_theme_font_size_override("font_size", alertLabel.get_theme_font_size("font_size") + 2)
		await get_tree().create_timer(.02).timeout
	for i in range(0, 10):
		alertLabel.add_theme_font_size_override("font_size", alertLabel.get_theme_font_size("font_size") - 2)
		await get_tree().create_timer(.02).timeout
	alertLabel.visible = false
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	alertLabel.visible = false
	get_parent().updateScore.connect(addScore)
	get_parent().alert.connect(alert)
	get_parent().highScoreLabel.connect(updateHighScoreLabel)
	
