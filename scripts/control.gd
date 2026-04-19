extends CharacterBody2D

var vertSpeed = 0
var jumpSpeed = -500
var fallingConstant = -1800
@onready var jumpSound = $"../JumpSound"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("hello")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("jump"):
		vertSpeed = jumpSpeed
		jumpSound.play()
		
	
	vertSpeed -= fallingConstant * delta
	velocity.y = vertSpeed
	move_and_slide()

		
	
