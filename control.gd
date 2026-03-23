extends AnimatedSprite2D

var vertSpeed = 0
var jumpSpeed = -350
var fallingConstant = -1800

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("hello")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("jump"):
		vertSpeed = jumpSpeed
	
	position.y += vertSpeed * delta
	vertSpeed -= fallingConstant * delta
		
	
