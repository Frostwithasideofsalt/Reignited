extends CanvasLayer

func _process(delta):
	$Hcoin.text =  String(globallevel.hcoin) + "/32"
	$Templabel.text =  "hp " + String(globallevel.hp) + "    energy " + String(globallevel.nrg)
	
