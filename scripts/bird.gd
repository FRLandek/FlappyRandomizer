extends CharacterBody2D

var vertSpeed = 0
var jumpSpeed = -550
var fallingConstant = -1800
var alive = true
var moving = false
var birdColor = 0
var rng = RandomNumberGenerator.new()
var birdSize = 1

@onready var jumpSound = $"JumpSound"
@onready var hitSound = $"HitSound"
@onready var dieSound = $"DieSound"

signal died
signal start

func stop():
	alive = false
	
func changeBirdColor():
	var r = birdColor
	while r == birdColor:
		r = rng.randi_range(0,2)
	birdColor = r
	if birdColor == 0:
		$AnimatedSprite2D.sprite_frames = load("res://animations/yellow.tres")
	elif birdColor == 1:
		$AnimatedSprite2D.sprite_frames = load("res://animations/blue.tres")
	else:
		$AnimatedSprite2D.sprite_frames = load("res://animations/red.tres")
	$AnimatedSprite2D.play("idle")

func changeBirdSize():
	var r = birdSize
	while r == birdSize:
		r = rng.randi_range(0,2)
	birdSize = r
	if birdSize == 0: $AnimatedSprite2D.scale = Vector2(2,2)
	if birdSize == 1: $AnimatedSprite2D.scale = Vector2(3.5,3.5)
	if birdSize == 2: $AnimatedSprite2D.scale = Vector2(5,5)
	
func changeJumpPower():
	jumpSpeed = rng.randi_range(-350,-620)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play("idle")
	get_parent().changeBirdColor.connect(changeBirdColor)
	get_parent().birdSize.connect(changeBirdSize)
	get_parent().jumpPower.connect(changeJumpPower)

	
func die() -> void:
	hitSound.play()
	dieSound.play()
	emit_signal("died")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	
	if moving:
		vertSpeed -= fallingConstant * delta
		velocity.y = vertSpeed
		var collision = move_and_slide()
		if alive:
			if Input.is_action_just_pressed("jump"):
				vertSpeed = jumpSpeed
				jumpSound.play()
				
			if collision:
				die()
				
	else:
		if Input.is_action_just_pressed("jump"):
			moving = true
			vertSpeed = jumpSpeed
			jumpSound.play()
			start.emit()
		
	

	

		
	
