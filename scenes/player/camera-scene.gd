extends KinematicBody2D
func _physics_process(_delta):
	position.y  = position.y + ((globallevel.camseek.y) - (position.y) / 32)
	position.x  = position.x + ((globallevel.camseek.x) - (position.x) / 32)
