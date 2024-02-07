extends KinematicBody2D

var velocity = Vector2(0,0)
var h_hey_press = 0
var friction = 0.8
var jump_duration = 16
var can_jump = false
var Koyote_time = 0

var horizontal_speed = 0
#this variable is used for the characters Hspeed. Not using velocity for this so slopes aren't an isssue. Threre is probably a way to do this without needing an extra variable, but i don't know it. 
var can_dash = 65
#can_dash above 64, means player can dash
var dash_time = 0
#dash_time shows how much longer a player has during the dash move
var dash_direction = 0
#dash_direction shows direction player moves while dashing
var jump_buffer = 0
#attempt three
var move_physics_mult = 0

var canjump = true
var run_direction = 1

var state = 0


var dash_ghost_offset = Vector2(0,0)


const PATTACK = preload("res://scenes/player/projectile-player/Player-attack.tscn")
const SPK = preload("res://scenes/particles/AnimatedSprite.tscn")

func swap_state(a):
	match a:
		0:
			state = 0;
			canjump = true;
		1:
			state = 1;
			canjump = true;
			
		

#This should be refactored at some point
func _ready():
	globallevel.cammod = 0


func _physics_process(_delta):
	
	
	
	move_physics_mult = _delta * 60
	
	#key press stuff
	h_hey_press = int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left"))
	if h_hey_press != 0:
		run_direction = h_hey_press
	#Left and right movment

	velocity.x = horizontal_speed
	
	

	match state:
		0:
			if h_hey_press == 1 and horizontal_speed < 160 :
				horizontal_speed += (80 - (80 * friction)) * move_physics_mult
				$AnimatedSprite.flip_h = false
			elif h_hey_press == -1 and horizontal_speed > -160:
				horizontal_speed += -(80 - (80 * friction)) * move_physics_mult
				$AnimatedSprite.flip_h = true
			elif h_hey_press == 0:
				horizontal_speed = horizontal_speed *(friction) 
				
			
			if Input.is_action_pressed("action-2"):
				swap_state(1)
				
				
		1:
			
			if Input.is_action_pressed("action-2") == false:
				swap_state(0)
			
			#if abs(horizontal_speed + (80 * run_direction)) > 999999:
			print(horizontal_speed + (80 * run_direction))
			
			if abs(horizontal_speed) < 280:
				horizontal_speed += (80 * move_physics_mult) * run_direction
			


	if canjump == true:
		if Input.is_action_just_pressed("Jump"):
			jump_buffer = 12

		if !Input.is_action_pressed("Jump") or ( (jump_buffer > 0) and is_on_floor() ):
			if  Koyote_time >= 1:
				jump_duration = 12
			else: 
				jump_duration = 0
			
		if (Input.is_action_pressed("Jump") or jump_buffer > 0) and jump_duration >= 1:
			if jump_duration == 12:
				$Jump.play()
			can_jump = true
			velocity.y = -260
			jump_buffer = 0
			jump_duration = jump_duration - move_physics_mult
			Koyote_time = 0
	
	
	

	#physics
	if !is_on_floor():
		
	
		velocity.y += 16 * move_physics_mult
			
		Koyote_time = Koyote_time - 1
		
		if is_on_ceiling():
			
			velocity.y = 16
			jump_duration = 0
			
	else:
		if (horizontal_speed >= 161 or horizontal_speed <= -161):
			horizontal_speed = horizontal_speed * 0.96
		can_jump = false
		Koyote_time = 8
	
	
	velocity = move_and_slide(velocity, Vector2.UP)
	
	jump_buffer = jump_buffer - move_physics_mult
	

	
	$test.text = "state: "+ String(state)
	
	globallevel.camseek.y = (velocity.y / 256)
	globallevel.camseek.x = (velocity.x / 256)
	globallevel.playerpos = position
	
	
	#debug stuff 




		
