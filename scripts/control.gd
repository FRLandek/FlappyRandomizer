extends AnimatedSprite2D

var vertSpeed = 0
var jumpSpeed = -450
var fallingConstant = -1800
@onready var jumpSound = $"../JumpSound"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("hello")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("jump"):
		vertSpeed = jumpSpeed
		jumpSound.play()
		
	
	position.y += vertSpeed * delta
	vertSpeed -= fallingConstant * delta
		
	
