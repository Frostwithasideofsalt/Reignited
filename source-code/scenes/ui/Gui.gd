extends CanvasLayer

func _process(delta):
	visible =  not globallevel.paused
	$Hcoin.text =  String(globallevel.hcoin) + "/12"
	$Phealth.text =  String(globallevel.hp) + "/24"
	$Scount.text = "Score; " + String(globallevel.score)
	$Templabel.text =   "att energy; " +String(globallevel.nrg) + "/64 | fps: " + String(Engine.get_frames_per_second())# +  " | dsh energy; " +  String(globallevel.dsh)
	
