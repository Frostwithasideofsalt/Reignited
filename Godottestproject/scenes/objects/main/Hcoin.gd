extends Node2D



func _ready():
	pass




func _on_Hcoin_body_entered(body):
	globallevel.hcoin = globallevel.hcoin + 1
	if globallevel.hp == 24:
		globallevel.score = globallevel.score + 10
	else:
		globallevel.score = globallevel.score + 5
	queue_free()


