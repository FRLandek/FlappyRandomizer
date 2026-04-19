extends Node2D

var score = 0
var rng = RandomNumberGenerator.new()

signal updateScore
signal changeBG
signal weirdBG
signal changePipes
signal changeBirdColor
signal birdSize
signal jumpPower
signal alert

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
			
func random():
	print("random")
	#var r = rng.randi_range(1,3)
	var r = 6
	if r == 1: 
		alert.emit("Change Background!")
		changeBG.emit()
	if r == 2: 
		alert.emit("Weird Background!")
		weirdBG.emit()
	if r == 3: 
		alert.emit("Change Pipes!")
		changePipes.emit()
	if r == 4: 
		alert.emit("Change Bird!")
		changeBirdColor.emit()
	if r == 5: 
		alert.emit("Change Size!")
		birdSize.emit()
	if r == 6: 
		alert.emit("Change Jump!")
		jumpPower.emit()
	
		
			
func scored():
	score += 1
	updateScore.emit(score)
	#if score % 3 == 0:
	random()
	
	
			
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Bird.died.connect(on_bird_died)
	$Bird.start.connect(startGame)
	$Pipes1/ScoreZone.scored.connect(scored)
	$Pipes2/ScoreZone.scored.connect(scored)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
