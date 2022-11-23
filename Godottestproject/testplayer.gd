extends KinematicBody2D
# this is the test character 
var vsp = Vector2(0,0)
var hkp = 0
var friction = 0.8
#lower the number the more friction there is.



func _physics_process(delta):
	#key press stuff
	hkp = int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left"))
	
	if hkp == 1 and vsp.x < 150:
		vsp.x = vsp.x +(60 - (60 * friction))
	if hkp == -1 and vsp.x > -150:
		vsp.x = vsp.x -(60 - (60 * friction))
	if hkp == -0:
		vsp.x = vsp.x *(friction) 
	 
	move_and_slide(vsp)
	

	

