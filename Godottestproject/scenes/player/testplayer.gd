extends KinematicBody2D
# this is the test character 
var vsp = Vector2(0,0)
#vsp normally means vertial speed but i am dumb and it's just used for velocity 
var hkp = 0
#The name of this variable stands for "Horizonal key press" which doesn't make much sense but it works for me. Also use this variable instead of checking if either the left or right key is pressed
var friction = 0.8
#lower the number the more friction there is.
var Jdr = 15
#this stands for jump duration. used to do stuff relating to variable jump height.



func _physics_process(delta):
	#key press stuff
	hkp = int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left"))
	
	#Left and right movment
	if hkp == 1 and vsp.x < 150:
		vsp.x = vsp.x +(60 - (60 * friction))
	if hkp == -1 and vsp.x > -150:
		vsp.x = vsp.x -(60 - (60 * friction))
	if hkp == -0:
		vsp.x = vsp.x *(friction) 
	
	#Jumping
	if !Input.is_action_pressed("Jump"):
		if is_on_floor(): 
			Jdr = 15
		else: 
			Jdr = -1
		
	
	if Input.is_action_pressed("Jump") and Jdr >= 0:
		vsp.y = -180
		Jdr = Jdr - 1
	
	
	
	#physics
	vsp.y = vsp.y + 15 
	vsp = move_and_slide(vsp,Vector2.UP)
	
	

	

