extends AnimatedSprite

var life = 128

func _process(delta):
	life = life - 1
	if life <= 1:
		queue_free()
