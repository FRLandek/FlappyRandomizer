extends Node2D

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position.y = rng.randi_range(-250, 250)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= 1.5
	
	if position.x < -100:
		position.x = 600
		position.y = rng.randi_range(-250, 250)
		
