extends CanvasLayer
var seconds = 0
var minutes = 0
var msec = 0

var debug = false 

func _ready():
	$combometer.position.y = -200
	
func _physics_process(delta):

	visible =  not globallevel.paused
	$Bars1.scale = Vector2(globallevel.hp * -2 ,1)
	$Bars2.scale = Vector2(globallevel.hcoin * -8 ,1)
	
	#ui
	$Scount.text = "Score: " + String(globallevel.score)
	if globallevel.Combo == 0:
		$combometer/Combo.text = "Combo:"
		$combometer.position.y = $combometer.position.y + ((-200 - $combometer.position.y) / 64 )
	else:
		$combometer/Combo.text = "Combo: x" + String(globallevel.Combo)
		$combometer.position.y = $combometer.position.y + ((0 - $combometer.position.y) / 16 )
	$combometer/Bars3.scale = Vector2(globallevel.Combo_timer * -2 ,1)
	
	
	if globalsetting.SFPS == true:
		$Templabel.text = "fps: " + String(Engine.get_frames_per_second())
	else:
		$Templabel.text = ""
	#timer 
	if visible == true:
		globallevel.timer += delta
	if globalsetting.timer_show == true:
		seconds = int(fmod(globallevel.timer, 60))
		minutes = int(fmod(globallevel.timer, 3600)/60)
		msec = fmod(globallevel.timer,1)*1000
		$Timer.text =  "time: " + str(minutes) + ":" + "%02d" % seconds + ":" + "%03d" % msec
	else:
		$Timer.text = ""
		
		
	
	
	
	#debug mode
		
		if Input.is_action_just_pressed("F12"):
			debug = true
			$DEBUG.visible = true
			$debugpanel.visible = true
			print("debug mode enabled")
		
		if Input.is_action_just_pressed("F11"):
			AudioServer.set_bus_mute(AudioServer.get_bus_index("Sounds"), true)
			globalsetting.music_muted = true
			AudioServer.set_bus_mute(AudioServer.get_bus_index("Music"), true)
			globalsetting.muted = true
			print("muted audio")
		
		if Input.is_action_just_pressed("F10"):
			if debug == true:
				get_tree().change_scene("res://scenes/levels/Test/test.tscn")
				print("Entered debug stage")
			else:
				print("You must be in debug mode to use this")
		
		if debug == true:
			$DEBUG.text = " -Debug panel-\nKill value; " + (str(5 + round((globallevel.Combo_timer / 32) * 5) + round(globallevel.Combo / 2))) + "\nGame speed; " + str(1/(delta * 60)) + "\nCamera Seek;\nx: " + str(globallevel.camseek.x) + "\ny: " + str(globallevel.camseek.y)
