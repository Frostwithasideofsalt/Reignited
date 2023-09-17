extends VBoxContainer



func _on_Play_pressed():
	globallevel.paused = false
	get_tree().change_scene("res://scenes/levels/Test/forest-challenge.tscn")
	globallevel.score = 0
	Scripts.reset_level()


func _on_TEST_pressed():
	globallevel.paused = false
	get_tree().change_scene("res://scenes/levels/Test/Test1.tscn")
	globallevel.score = 0
	Scripts.reset_level()

func _on_Options_pressed():
	globallevel.paused = false
	get_tree().change_scene("res://scenes/ui/Options.tscn")


func _on_Quit_pressed():
	get_tree().quit()


func _on_info_pressed():
	globallevel.paused = false
	get_tree().change_scene("res://scenes/ui/info.tscn")

