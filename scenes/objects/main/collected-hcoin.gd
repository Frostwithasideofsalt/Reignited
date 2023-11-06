extends AnimatedSprite
var phase = 1
var vsp = -3

func _ready():
	$AudioStreamPlayer2D.play()
func _physics_process(_delta):
	vsp = vsp + 0.25
	match(phase): 
		1:
			position.y = position.y + vsp
			if vsp >= 3:
				play("shine")
				set_frame(0)
				phase = 2
				rotate((randi() % 100)/2)
		2: 
			if vsp >= 7:
				queue_free()
