extends KinematicBody2D
const blockitem = preload("res://scenes/objects/main/Hcoin.tscn")

func _on_Area2D_body_entered(body):
	var a = blockitem.instance()
	get_parent().add_child(a)
	a.position = position
	queue_free()
