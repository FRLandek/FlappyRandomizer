extends CharacterBody2D

var vertSpeed = 0
var jumpSpeed = -550
var fallingConstant = -1800
var alive = true
var moving = false

@onready var jumpSound = $"JumpSound"
@onready var hitSound = $"HitSound"
@onready var dieSound = $"DieSound"

signal died
signal start

func stop():
	alive = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play("idle")

	
func die() -> void:
	hitSound.play()
	dieSound.play()
	emit_signal("died")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	
	var collision = move_and_slide()
	
	if moving:
		if alive:
			if Input.is_action_just_pressed("jump"):
				vertSpeed = jumpSpeed
				jumpSound.play()
				
			if collision:
				die()
				
		vertSpeed -= fallingConstant * delta
		velocity.y = vertSpeed
	else:
		if Input.is_action_just_pressed("jump"):
			moving = true
			vertSpeed = jumpSpeed
			jumpSound.play()
			start.emit()
		
	

	

		
	
