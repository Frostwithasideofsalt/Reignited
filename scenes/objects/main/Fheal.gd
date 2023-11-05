extends Node2D
const Coincollect = preload("res://scenes/objects/main/collected-hcoin.tscn")

func _ready():
	pass


func _on_Fheal_body_entered(body):
	if globallevel.hp == 24:
		globallevel.score = globallevel.score + 150
	else:
		globallevel.score = globallevel.score + 100
	globallevel.hp = 24
	globallevel.Combo_timer = 32
	var a = Coincollect.instance()
	get_parent().add_child(a)
	a.position = position
	queue_free()
