extends VBoxContainer

func _on_Button_pressed():
	globallevel.paused = false
	get_tree().change_scene("res://scenes/levels/Test/Test1.tscn")
	Scripts.reset_level()


func _on_Button2_pressed():
	globallevel.paused = false
	get_tree().change_scene("res://scenes/levels/Test/forest-challenge.tscn")
	Scripts.reset_level()
