extends Node2D

@onready var scoreLabel = $"ScoreLabel"
@onready var deco = $"Deco"

func start():
	var a = 1
	for i in range(0,11):
		deco.modulate = Color(1,1,1,a)
		await get_tree().create_timer(.03).timeout
		a -= .1
	

func addScore(score):
	scoreLabel.text = str(score)
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_parent().updateScore.connect(addScore)
	
