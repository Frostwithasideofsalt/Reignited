extends AnimatedSprite
var lyf = 30

func _ready():
	set_frame(0)

func _physics_process(delta):
	lyf = lyf - (delta * 60) 
	if lyf < 1:
		queue_free()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
