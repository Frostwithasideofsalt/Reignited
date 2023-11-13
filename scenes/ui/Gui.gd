extends CanvasLayer
var seconds = 0
var minutes = 0
var msec = 0

func _ready():
	$combometer.position.y = -200
	
func _physics_process(delta):

	visible =  not globallevel.paused
	$Bars1.scale = Vector2(globallevel.hp * -2 ,1)
	$Bars2.scale = Vector2(globallevel.hcoin * -4 ,1)
	
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
		
		
func update_scorecount():
#		if globallevel.score >= 200:
#			$Ranks/rank.text = "C"
#			if globallevel.score >= 750:
#				$Ranks/rank.text = "B"
#				if globallevel.score >= 1350:
#					$Ranks/rank.text = "A"
#					if globallevel.score >= 2200:
#						$Ranks/rank.text = "S"
	if globallevel.score >= 2200:
		$Ranks/rank.text = "S"
						
					
		
