extends VBoxContainer

func _enter_tree():
	
	if globalsetting.muted == true:
		$Mute.text = "Sounds -off-"
	else:
		$Mute.text = "Sounds -on-"
		
	if globalsetting.control_hints == true:
		$Controls.text = "Control reminders -on-"
	else:
		$Controls.text = "Control reminders -off-"
	
	if globalsetting.SFPS == true:
		$Fps.text = "Show FPS -on-"
	else:
		$Fps.text = "Show FPS -off-"
		
	if globalsetting.timer_show == true:
		$timer.text = "Show timer -on-"
	else:
		$timer.text = "Show timer -off-"
		
	if globalsetting.music_muted == true:
		$Mute_music.text = "Music -off-"
	else:
		$Mute_music.text = "Music -on-"
	
	
func _physics_process(delta):
	if Input.is_action_just_pressed("escape"):
		get_tree().change_scene("res://scenes/Main.tscn")
		
func _on_Exit_pressed():
	get_tree().change_scene("res://scenes/Main.tscn")


func _on_Mute_pressed():
	if globalsetting.muted == true:
		$Mute.text = "Sounds -on-"
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Sounds"), false)
		globalsetting.muted = false
	else:
		$Mute.text = "Sounds -off-"
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Sounds"), true)
		globalsetting.muted = true
		

func _on_Fps_pressed():
	globalsetting.SFPS = not(globalsetting.SFPS)
	if globalsetting.SFPS == true:
		$Fps.text = "Show FPS -on-"
	else:
		$Fps.text = "Show FPS -off-"


func _on_fullscreen_pressed():
	 OS.window_fullscreen = !OS.window_fullscreen


func _on_Controls_pressed():
	globalsetting.control_hints = not(globalsetting.control_hints)
	if globalsetting.control_hints == true:
		$Controls.text = "Control reminders -on-"
	else:
		$Controls.text = "Control reminders -off-"


func _on_timer_pressed():
	globalsetting.timer_show = not(globalsetting.timer_show)
	if globalsetting.timer_show == true:
		$timer.text = "Show timer -on-"
	else:
		$timer.text = "Show timer -off-"


func _on_Mute_music_pressed():
	if globalsetting.music_muted == true:
		$Mute_music.text = "Music -on-"
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Music"), false)
		globalsetting.music_muted = false
	else:
		$Mute_music.text = "Music -off-"
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Music"), true)
		globalsetting.music_muted = true
