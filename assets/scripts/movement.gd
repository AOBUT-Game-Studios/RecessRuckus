extends KinematicBody2D

#Basic Movement Code for Testing
#REDO LATER

var velocity = Vector2()
export(float) var mvmntSpeed = 300
export(float) var jumpSpeed = 160
export(float) var fallSpeed = 200
var jump = false #only true if jumping is initiated
var jumpLeft = false #only true if moving left before jumping
var jumpRight = false  #only true if moving right before jumping
var jumpArc = 15
var jumpArcDef = 6

#updates game state each frame
func _physics_process(delta):
	get_input() #receive player movement related inputs
	if (jump):
		jump()
	velocity = move_and_slide(velocity) #Takes the change in velicity and rounds it off to make it seems smoother

#gets input and changes velocity and statuses accordingly
func get_input():
	velocity = Vector2()
	if(Input.is_action_pressed("right") && !jump):
		velocity.x += 1
	if(Input.is_action_pressed("Left") && !jump):
		velocity.x -= 1
	if(Input.is_action_just_pressed("jump") && !jump):
		jumpArc = jumpArcDef
		jump = true
		if(Input.is_action_pressed("Left")):
			jumpLeft = true
		if(Input.is_action_pressed("right")):
			jumpRight = true
			
	velocity = velocity.normalized() * mvmntSpeed
	
#code for each individual jump patern
func jump():
	if(self.is_on_wall()): #detects if player is against wall and resets jump
		jump = false
		jumpLeft = false
		jumpRight = false 
	elif(jumpLeft && jumpArc < 0):
		jumpArc -= 0.2
		velocity.y -= jumpArc * fallSpeed
		velocity.x -= 1 * mvmntSpeed
	elif(jumpRight && jumpArc < 0):
		jumpArc -= 0.2
		velocity.y -= jumpArc * fallSpeed
		velocity.x += 1 * mvmntSpeed
	elif(jump && jumpArc < 0):
		jumpArc -= 0.2
		velocity.y -= jumpArc * fallSpeed
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
