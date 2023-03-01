extends CanvasLayer

func _process(delta):
	$Hcoin.text =  String(globallevel.hcoin) + "/12"
	$Phealth.text =  String(globallevel.hp) + "/24"
	$Scount.text = "Score; " + String(globallevel.score)
	$Templabel.text =   "energy; " +String(globallevel.nrg) + "/64 fps: " + String(Engine.get_frames_per_second()) + "      PLACEHOLDER UI!"
	
