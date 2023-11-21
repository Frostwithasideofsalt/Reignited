extends Control

var screen = 0 

func _input(event):
	if Input.is_action_just_pressed("escape"):
		$Optionspause.visible  = false
		$Main.visible = true
		globallevel.paused = not get_tree().paused
		get_tree().paused = globallevel.paused
		visible =  globallevel.paused
		$Main/resume.grab_focus()
		if !globallevel.paused:
			$on.play()
			$AudioStreamPlayer.stop()
		else:
			$off.play()
			$AudioStreamPlayer.play()
		$on.stop()
	


func _on_retry_pressed():
	globallevel.hp = 0
	globallevel.invstate = 2
	globallevel.paused = false
	visible =  globallevel.paused
	globallevel.Combo_timer = 0
	get_tree().paused = false
	$AudioStreamPlayer.stop()
	$off.play()

func _on_exit_pressed():
	get_tree().paused = false
	globallevel.paused = false
	$off.play()
	globallevel.hcoin = 6
	get_tree().change_scene("res://scenes/Main.tscn")

func _on_resume_pressed():
	$AudioStreamPlayer.stop()
	get_tree().paused = false
	globallevel.paused = false
	visible =  globallevel.paused
	$off.play()


func _on_Options_pressed():
	$Optionspause.visible  = true
	$Main.visible = false
	
	if globalsetting.muted == true:
		$Optionspause/Mute.text = "Sounds -off-"
	else:
		$Optionspause/Mute.text = "Sounds -on-"
		
	if globalsetting.control_hints == true:
		$Optionspause/Controls.text = "Control reminders -on-"
	else:
		$Optionspause/Controls.text = "Control reminders -off-"
	
	if globalsetting.SFPS == true:
		$Optionspause/Fps.text = "Show FPS -on-"
	else:
		$Optionspause/Fps.text = "Show FPS -off-"
		
	if globalsetting.timer_show == true:
		$Optionspause/timer.text = "Show timer -on-"
	else:
		$Optionspause/timer.text = "Show timer -off-"
		
	if globalsetting.music_muted == true:
		$Optionspause/Mute_music.text = "Music -off-"
	else:
		$Optionspause/Mute_music.text = "Music -on-"
	
	
	$Optionspause/Mute_music.grab_focus()
	



func _on_Mute_pressed():
	if globalsetting.muted == true:
		$Optionspause/Mute.text = "Sounds -on-"
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Sounds"), false)
		globalsetting.muted = false
	else:
		$Optionspause/Mute.text = "Sounds -off-"
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Sounds"), true)
		globalsetting.muted = true
		


func _on_Fps_pressed():
	globalsetting.SFPS = not(globalsetting.SFPS)
	if globalsetting.SFPS == true:
		$Optionspause/Fps.text = "Show FPS -on-"
	else:
		$Optionspause/Fps.text = "Show FPS -off-"


func _on_fullscreen_pressed():
	 OS.window_fullscreen = !OS.window_fullscreen


func _on_Controls_pressed():
	globalsetting.control_hints = not(globalsetting.control_hints)
	if globalsetting.control_hints == true:
		$Optionspause/Controls.text = "Control reminders -on-"
	else:
		$Optionspause/Controls.text = "Control reminders -off-"


func _on_timer_pressed():
	globalsetting.timer_show = not(globalsetting.timer_show)
	if globalsetting.timer_show == true:
		$Optionspause/timer.text = "Show timer -on-"
	else:
		$Optionspause/timer.text = "Show timer -off-"


func _on_Back_pressed():
	$Optionspause.visible  = false
	$Main.visible = true
	$Main/resume.grab_focus()


func _on_Mute_music_pressed():
	if globalsetting.music_muted == true:
		$Optionspause/Mute_music.text = "Music -on-"
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Music"), false)
		globalsetting.music_muted = false
	else:
		$Optionspause/Mute_music.text = "Music -off-"
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Music"), true)
		globalsetting.music_muted = true
