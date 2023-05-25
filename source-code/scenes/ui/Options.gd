extends VBoxContainer
func _physics_process(delta):
	if Input.is_action_just_pressed("escape"):
		get_tree().change_scene("res://scenes/Main.tscn")
	$Fps.text = "Show FPS" + " (" + String(globalsetting.SFPS) + ")"
	$Mute.text = "Mute audio" + " (" + String(globalsetting.muted) + ")"
func _on_Exit_pressed():
	get_tree().change_scene("res://scenes/Main.tscn")


func _on_Mute_pressed():
	if globalsetting.muted == true:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), false)
		globalsetting.muted = false
	else:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), true)
		globalsetting.muted = true

func _on_Fps_pressed():
	globalsetting.SFPS = not(globalsetting.SFPS)


func _on_fullscreen_pressed():
	 OS.window_fullscreen = !OS.window_fullscreen
