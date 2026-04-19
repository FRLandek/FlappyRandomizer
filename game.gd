extends Node2D

var score = 0

signal updateScore

func on_bird_died():
	for thing in get_children():
		if thing.has_method("stop"):
			thing.stop()
			
	await get_tree().create_timer(3).timeout
	get_tree().reload_current_scene()
	
func startGame():
	for thing in get_children():
		if thing.has_method("start"):
			thing.start()
			
func scored():
	score += 1
	updateScore.emit(score)
	
	
			
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Bird.died.connect(on_bird_died)
	$Bird.start.connect(startGame)
	$Pipes1/ScoreZone.scored.connect(scored)
	$Pipes2/ScoreZone.scored.connect(scored)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
