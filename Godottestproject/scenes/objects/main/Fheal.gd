extends Node2D


func _ready():
	pass


func _on_Fheal_body_entered(body):
	globallevel.hp = 24
	queue_free()
