extends Node2D
func _physics_process(_delta):
	position.y  = position.y + ((globallevel.camseek.y) - (position.y) / 32)
	position.x  = position.x + ((globallevel.camseek.x) - (position.x) / 32)
	
#	if abs(globallevel.camseek.x) <= 0.00002:
#		position.x = 0
#		globallevel.camseek.x = 0
#	if abs(globallevel.camseek.y) <= 0.00002:
#		position.y = 0
#		globallevel.camseek.y = 0
