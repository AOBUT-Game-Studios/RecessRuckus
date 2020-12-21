extends AnimatedSprite

export(int) var delay = 4
var delaydef

func _ready():
	self.frame = 0
	delaydef = delay

func _physics_process(delta):
	delay -= 1
	if(delay == 0):
		delay = delaydef
		if(self.frame == 4):
			self.frame = 0
		self.frame += 1
	

