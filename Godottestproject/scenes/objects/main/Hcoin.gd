extends Node2D



func _ready():
	pass




func _on_Hcoin_body_entered(body):
	globallevel.hcoin = globallevel.hcoin + 1
	queue_free()


