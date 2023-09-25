extends VBoxContainer

func _on_Button_pressed():
	globalfunc.reset_level()
	globallevel.paused = false
	get_tree().change_scene("res://scenes/levels/Test/Test1.tscn")



func _on_Button2_pressed():
	globalfunc.reset_level()
	globallevel.paused = false
	get_tree().change_scene("res://scenes/levels/Test/forest-challenge.tscn")

