extends Node2D



func _ready():
	pass






func _on_HCoin_body_entered(body):
	globallevel.hcoin = globallevel.hcoin + 1
	queue_free()
