extends Node2D

var rng = RandomNumberGenerator.new()
var moving = false

func start():
	moving = true

func stop():
	moving = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position.y = rng.randi_range(-250, 250)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if moving:
		position.x -= 1.2
		
		if position.x < -70:
			position.x = 600
			#position.y = rng.randi_range(-225, 50)
			position.y = rng.randi_range(-220,170)
		
