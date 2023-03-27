extends Control

func _input(event):\
	if Input.is_action_just_pressed("escape"):
		globallevel.paused = not get_tree().paused
		get_tree().paused = globallevel.paused
		visible =  globallevel.paused
		




func _on_retry_pressed():
	get_tree().paused = false
	globallevel.paused = false
	globallevel.invstate = 2
	globallevel.hp = 0
	visible =  globallevel.paused


func _on_exit_pressed():
	get_tree().paused = false
	globallevel.paused = false
	get_tree().change_scene("res://scenes/Main.tscn")
	


func _on_resume_pressed():
	get_tree().paused = false
	globallevel.paused = false
	visible =  globallevel.paused
