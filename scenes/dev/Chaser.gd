extends Node2D

var a = 0
var b = 0
var c = 0

var s = 3.5
var active = false

# Called when the node enters the scene tree for the first time.

func _physics_process(delta):
	
	if Input.is_action_just_pressed("F5") and 500 > ((abs(position.x - globallevel.playerpos.x)) + (abs(position.y - globallevel.playerpos.y))) and globallevel.debug_mode == true:
		visible = true
		active = true
		globallevel.score = 3000
		
	if active == true:
		#if not((position.x == globallevel.playerpos.x) or (position.y == globallevel.playerpos.y)):
		#	a =(abs(position.x - globallevel.playerpos.x)) /((abs(position.x - globallevel.playerpos.x)) + (abs(position.y - globallevel.playerpos.y)))
		#	b = (position.x - globallevel.playerpos.x) / (abs(position.x - globallevel.playerpos.x)) * -1
		#	c = (position.y - globallevel.playerpos.y) / (abs(position.y - globallevel.playerpos.y)) * -1
		#position.x = position.x + (a*b)* s
		#position.y = position.y + ((1 - a) * c)* s
		
		a = sqrt(pow(position.x - globallevel.playerpos.x,2) + pow(position.y - globallevel.playerpos.y,2))
		print(a)
		if (a < 128):
			b = 128
		else:
			b = a
			
		
		position.x = position.x - ((position.x - globallevel.playerpos.x) / b * 4)
		position.y = position.y - ((position.y - globallevel.playerpos.y) / b * 4)

		if 30 > ((abs(position.x - globallevel.playerpos.x)) + (abs(position.y - globallevel.playerpos.y))):
			globallevel.hp = -0
			globallevel.invstate = 60
			queue_free()
			globallevel.score = 0
		elif 240 < ((abs(position.x - globallevel.playerpos.x)) + (abs(position.y - globallevel.playerpos.y))):
			s = 9
		else:
			s = 3.5
