extends VBoxContainer

func _physics_process(delta):
	if Input.is_action_just_pressed("escape"):
		get_tree().change_scene("res://scenes/Main.tscn")
	$Fps.text = "Show FPS" + " (" + String(globalsetting.SFPS) + ")"
	$Exit.text = "Exit" + " (" + String(Input.is_action_pressed("key")) + ")"

func _on_Exit_pressed():
	get_tree().change_scene("res://scenes/Main.tscn")


func _on_Mute_pressed():
	pass


func _on_Fps_pressed():
	globalsetting.SFPS = not(globalsetting.SFPS)


func _on_fullscreen_pressed():
	 OS.window_fullscreen = !OS.window_fullscreen
