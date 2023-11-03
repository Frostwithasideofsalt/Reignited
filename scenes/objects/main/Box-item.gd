extends KinematicBody2D
const blockitem = preload("res://scenes/objects/main/Hcoin.tscn")
const blockpart = preload("res://scenes/particles/boxes.tscn")

func _on_Area2D_body_entered(body):
	var a = blockitem.instance()
	get_parent().add_child(a)
	a.position = position
	
	var b = blockpart.instance()
	get_parent().add_child(b)
	b.typ = 1
	b.position = position
	
	queue_free()
