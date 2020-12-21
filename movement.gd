extends KinematicBody2D

#Basic Movement Code for Testing
#REDO LATER

var velocity = Vector2()
var mvmntSpeed = 160
var jumpSpeed = 160
var jump = false
var jumpLeft = false
var jumpRight = false
var jumpArc = 15
var jumpArcDef = 6

func _physics_process(delta):
	get_input(delta)
	jump(delta)
	velocity = move_and_slide(velocity)

func get_input(delta):
	velocity = Vector2()
	if(Input.is_action_pressed("right") && !jump):
		velocity.x += 1
	if(Input.is_action_pressed("Left") && !jump):
		velocity.x -= 1
	if(Input.is_action_just_pressed("jump_left") && !jump):
		jumpArc = jumpArcDef
		jumpLeft = true
		jump = true
	elif(Input.is_action_just_pressed("jump") && !jump):
		jumpArc = jumpArcDef
		jump = true
		if(Input.is_action_pressed("Left")):
			jumpLeft = true
		if(Input.is_action_pressed("right")):
			jumpRight = true
			
	velocity = velocity.normalized() * mvmntSpeed
	
func jump(delta):
	if(self.is_on_wall()):
		jump = false
		jumpLeft = false
		jumpRight = false 
	elif(jumpLeft):
		jumpArc -= 0.2
		velocity.y -= jumpArc * jumpSpeed
		velocity.x -= 1 * mvmntSpeed
	elif(jumpRight):
		jumpArc -= 0.2
		velocity.y -= jumpArc * jumpSpeed
		velocity.x += 1 * mvmntSpeed
	elif(jump):
		jumpArc -= 0.2
		velocity.y -= jumpArc * jumpSpeed
	
	
func stagger():
	#when hit with an attack
	pass

func fall():
	#when hit into a fall down
	pass
	
func dash():
	pass
