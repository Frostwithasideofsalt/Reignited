extends CanvasLayer

func _process(delta):
	visible =  not globallevel.paused
	$Bars1.scale = Vector2(globallevel.hp * -2 ,1)
	$Bars2.scale = Vector2(globallevel.hcoin * -4 ,1)
	
	#test ui
	$Scount.text = "Score; " + String(globallevel.score)
	
	if globalsetting.SFPS == true:
		$Templabel.text = " fps: " + String(Engine.get_frames_per_second())
	else:
		$Templabel.text = ""
