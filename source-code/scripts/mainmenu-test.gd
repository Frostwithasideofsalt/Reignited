extends Control
func _on_Button_pressed():
	globallevel.paused = false
	get_tree().change_scene("res://scenes/levels/Test/Test1.tscn")
