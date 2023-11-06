extends HBoxContainer

func _on_Quit_pressed():
	get_tree().change_scene("res://scenes/Main.tscn")


func _on_Github_pressed():
	OS.shell_open("https://github.com/Frostwithasideofsalt/Reignited")


func _on_Soundcloud_pressed():
	OS.shell_open("https://soundcloud.com/rodiroddude/sets/flames-land-re-ignited")
