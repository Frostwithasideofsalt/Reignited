extends Control
var On = preload("res://sounds/gui/select-on.ogg")
var Off = preload("res://sounds/gui/select-off.ogg")
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
		else:
			$off.play()
		$on.stop()
	


func _on_retry_pressed():
	globallevel.hp = 0
	globallevel.invstate = 2
	globallevel.paused = false
	visible =  globallevel.paused
	get_tree().paused = false
	$off.play()

func _on_exit_pressed():
	get_tree().paused = false
	globallevel.paused = false
	$off.play()
	globallevel.hcoin = 6
	get_tree().change_scene("res://scenes/Main.tscn")

func _on_resume_pressed():
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
	
	$Optionspause/Mute.grab_focus()
	



func _on_Mute_pressed():
	if globalsetting.muted == true:
		$Optionspause/Mute.text = "Sounds -on-"
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), false)
		globalsetting.muted = false
	else:
		$Optionspause/Mute.text = "Sounds -off-"
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), true)
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





