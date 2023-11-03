extends KinematicBody2D
const blockpart = preload("res://scenes/particles/boxes.tscn")

func _on_Area2D_body_entered(body):
	var b = blockpart.instance()
	get_parent().add_child(b)
	b.typ = 0
	b.position = position
	queue_free()
