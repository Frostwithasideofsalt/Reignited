extends KinematicBody2D


func _ready():
	pass


func _on_Area2D_body_entered(body):
	queue_free()
