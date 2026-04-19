extends Node2D

var rng = RandomNumberGenerator.new()
var moving = false
var top_pipe = 0
var bottom_pipe = 0
@onready var topPipe = $"TopPipe/Sprite2D"
@onready var bottomPipe = $"BottomPipe/Sprite2D"

func start():
	moving = true

func stop():
	moving = false
	
func changeTop():
	if top_pipe == 0:
		topPipe.region_rect = Rect2(0,323,26,160)
		top_pipe = 1
	else:
		topPipe.region_rect = Rect2(56,323,26,160)
		top_pipe = 0

func changeBottom():
	if bottom_pipe == 0:
		bottomPipe.region_rect = Rect2(28,323,26,160)
		bottom_pipe = 1
	else:
		bottomPipe.region_rect = Rect2(84,323,26,160)
		bottom_pipe = 0
		
func changePipes():
	var r = rng.randi_range(0,1)
	if r == 0: changeTop()
	else: changeBottom()
	
	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position.y = rng.randi_range(-250, 250)
	get_parent().changePipes.connect(changePipes)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if moving:
		position.x -= 1.2
		
		if position.x < -70:
			position.x = 600
			#position.y = rng.randi_range(-225, 50)
			position.y = rng.randi_range(-220,170)
		
