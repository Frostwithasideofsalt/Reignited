extends AnimatedSprite
var phase = 1
var vsp = -3


func _physics_process(delta):
	vsp = vsp + 0.25
	match(phase): 
		1:
			position.y = position.y + vsp
			if vsp >= 3:
				play("shine")
				set_frame(0)
				$AudioStreamPlayer2D.playing = true
				phase = 2
				rotate((randi() % 100)/2)
		2: 
			if vsp >= 7:
				queue_free()
