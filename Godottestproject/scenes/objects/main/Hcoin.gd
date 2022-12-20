extends Node2D



func _ready():
	pass






func _on_HCoin_body_entered(body):
	queue_free()
