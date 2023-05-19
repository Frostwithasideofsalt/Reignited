extends Control

#ADD KEYBOARD SUPPORT FORM MENUS!!!!! should not be overlooked

func _on_Button_pressed():
	globallevel.paused = false
	get_tree().change_scene("res://scenes/levels/Test/Test1.tscn")
	globallevel.score = 0


func _on_Button2_pressed():
	globallevel.paused = false
	get_tree().change_scene("res://scenes/levels/Test/forest-challenge.tscn")
	globallevel.score = 0
