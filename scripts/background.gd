extends Sprite2D

var bg = 0

func changeBG():
	if bg == 0:
		self.region_rect = Rect2(146,0,144,256)
		bg = 1
	else:
		self.region_rect = Rect2(0,0,144,256)
		bg = 0
		
func weirdBG():
	if !is_inside_tree():
		return
		
	if bg == 0:
		var x = 1
		while x < 73:
			self.region_rect = Rect2(x,0,144,256)
			x *= 1.1
			await get_tree().create_timer(.05).timeout
	else:
		var x = 146
		while x > 73:
			self.region_rect = Rect2(x,0,144,256)
			x *= .9
			await get_tree().create_timer(.05).timeout
		
		

func _ready() -> void:
	get_parent().changeBG.connect(changeBG)
	get_parent().weirdBG.connect(weirdBG)
