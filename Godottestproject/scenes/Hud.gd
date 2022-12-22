extends CanvasLayer

func _process(delta):
	$Hcoin.text =  String(globallevel.hcoin) + "/12"
	$Templabel.text =  "hp: " + String(globallevel.hp) + "/24 energy: " + String(globallevel.nrg) + "/64 fps: " + String(Engine.get_frames_per_second())
	
