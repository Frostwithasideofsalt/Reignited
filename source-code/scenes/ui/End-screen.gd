extends CanvasLayer

var seconds = 0
var minutes = 0
var msec = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	
	seconds = int(fmod(globallevel.timer, 60))
	minutes = int(fmod(globallevel.timer, 3600)/60)
	msec = fmod(globallevel.timer,1)*1000

	$point.text = " score: " + str(globallevel.score)
	$time.text = " time: " + "%02d" % minutes + ":" + "%02d" % seconds + ":" + "%03d" % msec

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_retry_pressed():
	get_tree().change_scene("res://scenes/levels/Test/forest-challenge.tscn")
	globalfunc.reset_level()


func _on_exit_pressed():
	get_tree().change_scene("res://scenes/Main.tscn")
