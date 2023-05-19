extends KinematicBody2D
# this is the test character 
var vsp = Vector2(0,0)
#vsp normally means vertial speed but i am dumb and it's just used for velocity 
var hkp = 0
#The name of this variable stands for "Horizonal key press" which doesn't make much sense but it works for me. Also use this variable instead of checking if either the left or right key is pressed
var friction = 0.8
#lower the number the more friction there is.
var Jdr = 16
#this stands for jump duration. used to do stuff relating to variable jump height.
var Jmp = 0
#this variable is 1 when the player is falling
var Kyt = 0
#this variable handles kiyote timestop_on_slope 
var rns = 0
#this variable is used for the characters Hspeed. Not using vsp for this so slopes aren't an isssue. Threre is probably a way to do this without needing an extra variable, but i don't know it. 
var candash = 65
var dshtime = 0
var dshdir = 0
#candash above 64, means player can dash
#dshtime shows how much longer a player has during the dash move
#dshdir shows direction player moves while dashing
const PATTACK = preload("res://scenes/player/projectile-player/Player-attack.tscn")
const SPK = preload("res://scenes/particles/AnimatedSprite.tscn")

#This should be refactored at some point


func _physics_process(_delta):
	#key press stuff
	hkp = int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left"))
	#Left and right movment
	if hkp == 1 and rns < 160 :
		rns = rns +(80 - (80 * friction))
		$AnimatedSprite.flip_h = false
	elif hkp == -1 and rns > -160:
		rns = rns -(80 - (80 * friction))
		$AnimatedSprite.flip_h = true
	elif hkp == 0 and dshtime <= 0 :
		rns = rns *(friction) 
	vsp.x = rns
	
	
	#Jumping
	if !Input.is_action_pressed("Jump"):
		if  Kyt >= 1:
			Jdr = 20
		else: 
			Jdr = 0
		
	if Input.is_action_pressed("Jump") and Jdr >= 1:
		Jmp = 1
		vsp.y = -196
		Jdr = Jdr - 1
		Kyt = 0
		
	#animations weeee
	#when the programming is extremely questionable! :tuxflush:
	if  dshtime >= 0:
		$AnimatedSprite.play("dash")
	else:
		if Jmp == 0 :
			if hkp == 0 :
				$AnimatedSprite.play("idle")
				
			else: 
				$AnimatedSprite.play("walk")
		else:
			if int(round(vsp.y)) >= 14 :
				$AnimatedSprite.play("jump-fall")
			else:
				$AnimatedSprite.play("jump-rise")
		
		Kyt = Kyt - 1
		
	#physics
	if !is_on_floor():
		if vsp.y <= 384:
			vsp.y = vsp.y + 16
		Kyt = Kyt - 1
		if is_on_ceiling():
			vsp.y = 16
			Jdr = 0
	else:
		if (rns >= 161 or rns <= -161) and dshtime <= 0:
			rns = rns * 0.96
		Jmp = 0
		Kyt = 8

	vsp = move_and_slide(vsp, Vector2.UP)
	
	#Attack
		
	if  globallevel.nrg <= 47:
		globallevel.nrg = globallevel.nrg + 1
	
	if Input.is_action_just_released("action") and globallevel.nrg >= 47:
		var a = PATTACK.instance()
		globallevel.nrg = 0
		#probably a way better way to this, but i don't have the patiance to do that right now.
		if int($AnimatedSprite.flip_h) == 0:
			a.dir = 1
		if int($AnimatedSprite.flip_h) == 1:
			a.dir = -1
		a.pmom = vsp.x 
		get_parent().add_child(a)
		a.position = position
	
	#Dash
	
	candash = candash + 1
	
	if candash <= 64 and !dshtime >= 0:
		modulate = Color(0.7,0.6,0.5)
	else:
		modulate = Color(1,1,1)
	
	
	if Input.is_action_pressed("action-2") and candash >= 63:
		dshtime = 16
		candash = 0
		if $AnimatedSprite.flip_h == true:
			dshdir = -1
		else:
			dshdir = 1
				
	if dshtime >= 0:
		rns = 320 *dshdir
		vsp.y = 0
		dshtime = dshtime - 1 
		if is_on_wall() or Input.is_action_pressed("Jump"):
			dshtime = -1
	#Coins
	
	if globallevel.hcoin >= 12:
		globallevel.hcoin = 0
		if globallevel.hp < 23:
			globallevel.hp = globallevel.hp + 1 
			
	#damage 
	
	if globallevel.invstate >= 1:
		if globallevel.hp <= 1:
			self.position = globallevel.swn 
			#sends player back to spawn
			globallevel.invstate = 0
			globallevel.hp = 24
			globallevel.score = globallevel.score - 800
			#reset player hp, and score penalty 
		modulate.a = 0.5
		globallevel.invstate = globallevel.invstate - 1 
	else :
		modulate.a = 1
	
	#TEMP
	 
	if Input.is_action_pressed("fullscreen"):
		globallevel.swn = Vector2(self.position.x,self.position.y)
		
	$test.text = String(globallevel.swn)
	
	#TEMPORARY(?) CODE, player acts kinda silly if you remove this
	
	self.position.x = round(self.position.x)
	self.position.y = round(self.position.y)
	
	#if Input.is_action_pressed("escape"):
	#	get_tree().change_scene("res://scenes/levels/Test/Test1.tscn")
	
	






# warning-ignore:unused_argument
func _on_Killzone_body_entered(body):
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/levels/Test/Test1.tscn")
	#self.position = spwn
