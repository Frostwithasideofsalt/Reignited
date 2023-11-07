extends Node2D

var a = 0
var b = 0
var c = 0

var s = 3.5

# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	if not((position.x == globallevel.playerpos.x) or (position.y == globallevel.playerpos.y)):
		a =(abs(position.x - globallevel.playerpos.x)) /((abs(position.x - globallevel.playerpos.x)) + (abs(position.y - globallevel.playerpos.y)))
		b = (position.x - globallevel.playerpos.x) / (abs(position.x - globallevel.playerpos.x)) * -1
		c = (position.y - globallevel.playerpos.y) / (abs(position.y - globallevel.playerpos.y)) * -1
	position.x = position.x + (a*b)* s
	position.y = position.y + ((1 - a) * c)* s
	

	if 30 > ((abs(position.x - globallevel.playerpos.x)) + (abs(position.y - globallevel.playerpos.y))):
		globallevel.hp = -0
		globallevel.invstate = 60
	elif 240 < ((abs(position.x - globallevel.playerpos.x)) + (abs(position.y - globallevel.playerpos.y))):
		s = 9
	else:
		s = 3.5
	print (s)
