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


const PATTACK = preload("res://scenes/player/projectile-player/Player-attack.tscn")
const SPK = preload("res://scenes/particles/AnimatedSprite.tscn")

#This should be refactored at some point
func _ready():
	globallevel.cammod = 0


func _physics_process(_delta):
	#key press stuff
	h_hey_press = int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left"))
	#Left and right movment
	if h_hey_press == 1 and horizontal_speed < 160 :
		horizontal_speed = horizontal_speed +(80 - (80 * friction))
		$AnimatedSprite.flip_h = false
	elif h_hey_press == -1 and horizontal_speed > -160:
		horizontal_speed = horizontal_speed -(80 - (80 * friction))
		$AnimatedSprite.flip_h = true
	elif h_hey_press == 0 and dash_time <= 0 :
		horizontal_speed = horizontal_speed *(friction) 
	velocity.x = horizontal_speed
	
	
	#Jumping
	
	if Input.is_action_just_pressed("Jump"):
		jump_buffer = 12

	
	if !Input.is_action_pressed("Jump") or ( (jump_buffer > 0) and is_on_floor() ):
		if  Koyote_time >= 1:
			jump_duration = 12
		else: 
			jump_duration = 0
		
	if (Input.is_action_pressed("Jump") or jump_buffer > 0) and jump_duration >= 1:
		can_jump = true
		velocity.y = -260
		jump_buffer = 0
		jump_duration = jump_duration - 1
		Koyote_time = 0
		
	#animations weeee
	#when the programming is extremely questionable! :tuxflush:
	if  dash_time >= 0:
		$AnimatedSprite.play("dash")
	else:
		if can_jump == false :
			if h_hey_press == 0 :
				$AnimatedSprite.play("idle")
				
			else: 
				$AnimatedSprite.play("walk")
		else:
			if int(round(velocity.y)) >= 0 :
				$AnimatedSprite.play("jump-fall")
			else:
				$AnimatedSprite.play("jump-rise")
		Koyote_time = Koyote_time - 1
		
	#physics
	if !is_on_floor():
		if velocity.y <= 384:
			velocity.y = velocity.y + 16
		Koyote_time = Koyote_time - 1
		if is_on_ceiling():
			velocity.y = 16
			jump_duration = 0
	else:
		if (horizontal_speed >= 161 or horizontal_speed <= -161) and dash_time <= 0:
			horizontal_speed = horizontal_speed * 0.96
		can_jump = false
		Koyote_time = 8

	velocity = move_and_slide(velocity, Vector2.UP)
	
	#Attack
		
	if  globallevel.nrg <= 47:
		globallevel.nrg = globallevel.nrg + 1
	
	if Input.is_action_just_pressed("action") and globallevel.nrg >= 47:
		var a = PATTACK.instance()
		globallevel.nrg = 0
		#probably a way better way to this, but i don't have the patiance to do that right now.
		if int($AnimatedSprite.flip_h) == 0:
			a.dir = 1
		else:
			a.dir = -1
		a.pmom = velocity.x 
		get_parent().add_child(a)
		a.position = position
	
	#Dash
	
	can_dash = can_dash + 1
	
	if can_dash <= 64 and !dash_time >= 0:
		modulate = Color(0.7,0.6,0.5)
	else:
		modulate = Color(1,1,1)
	
	
	if Input.is_action_pressed("action-2") and can_dash >= 63:
		dash_time = 16
		can_dash = 0
		if $AnimatedSprite.flip_h == true:
			dash_direction = -1
		else:
			dash_direction = 1
				
	if dash_time >= 0:
		horizontal_speed = 320 *dash_direction
		velocity.y = 0
		dash_time = dash_time - 1 
		if is_on_wall() or Input.is_action_pressed("Jump"):
			dash_time = -1
			jump_buffer = 0
			velocity.y = -280
	#Coins
	
	if globallevel.hcoin >= 12 and globallevel.hp <= 23:
		globallevel.hcoin = 0
		if globallevel.hp < 24:
			globallevel.hp = globallevel.hp + 1 
			
	#damage 
	
	if globallevel.invstate >= 1:
		if globallevel.hp <= 1:
			self.position = globallevel.swn 
			#sends player back to spawn
			globallevel.invstate = 0
			globallevel.hp = 24
			globallevel.score = 0
			#reset player hp, and score penalty 
		modulate.a = 0.5
		globallevel.invstate = globallevel.invstate - 1 
	else :
		modulate.a = 1
	
	if globallevel.Combo_timer >= 1:
		globallevel.Combo_timer = globallevel.Combo_timer - 0.15
	else:
		globallevel.Combo = 0
		globallevel.Combo_timer = 0
	
	#TEMP
	jump_buffer = jump_buffer - 1
	$test.text = String(jump_buffer)
	self.position.x = round(self.position.x)
	self.position.y = round(self.position.y)
	globallevel.camseek.y = (velocity.y / 256)
	globallevel.camseek.x = (velocity.x / 256)
	if Input.is_action_pressed("ui_focus_next"):
		globalfunc.reset_level()
