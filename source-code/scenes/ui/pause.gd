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
	
