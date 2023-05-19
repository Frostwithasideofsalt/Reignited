extends AnimatedSprite
var time = 35
var typ 

#at some point i wanna replace this with proper particles 

func _ready():
	set_frame(0)
	match(typ):
		0:
			$AnimatedSprite.play("normal")
		1:
			$AnimatedSprite.play("bonus")

func _physics_process(delta):
	time = time - 1
	if time <= 1:
		queue_free()
