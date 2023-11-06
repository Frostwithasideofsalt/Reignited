extends AnimatedSprite
var life = 0

func _ready():
	$AudioStreamPlayer.play()
func _physics_process(delta):
	if life == 0:
		set_frame(0)
	life = life + (delta * 10)
	if life >= 5:
				queue_free()
