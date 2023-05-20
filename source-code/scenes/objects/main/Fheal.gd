extends Node2D


func _ready():
	pass


func _on_Fheal_body_entered(body):
	if globallevel.hp == 24:
		globallevel.score = globallevel.score + 150
	else:
		globallevel.score = globallevel.score + 100
	globallevel.hp = 24
	globallevel.hcoin = globallevel.hcoin + 1
	queue_free()
