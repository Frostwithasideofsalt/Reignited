extends Node2D
var collected = 0
var vsp = -3
const Coincollect = preload("res://scenes/objects/main/Hcoin-collect.tscn")
func _on_Hcoin_body_entered(body):
	if globallevel.hp == 24:
			globallevel.score = globallevel.score + 10
			if globallevel.hcoin <= 11:
				globallevel.hcoin = globallevel.hcoin + 1
	else:
			globallevel.score = globallevel.score + 5
			globallevel.hcoin = globallevel.hcoin + 1
	var a = Coincollect.instance()
	get_parent().add_child(a)
	a.position = position
	queue_free()
