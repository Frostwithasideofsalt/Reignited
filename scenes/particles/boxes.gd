extends AnimatedSprite
var time = 120
var typ 

#at some point i wanna replace this with proper particles 

func _ready():
	set_frame(0)

func _physics_process(delta):
	$"Sprite-1".position.x = $"Sprite-1".position.x - 1
	$"Sprite-1".position.y = $"Sprite-1".position.y + ((time - 110)* -0.2)
	$"Sprite-1".rotate(0.2)
	
	$"Sprite-2".position.x = $"Sprite-2".position.x + 1
	$"Sprite-2".position.y = $"Sprite-2".position.y + ((time - 110)* -0.2)
	$"Sprite-2".rotate(-0.2)
	
	$"Sprite-3".position.x = $"Sprite-3".position.x - 1
	$"Sprite-3".position.y = $"Sprite-3".position.y + ((time - 110)* -0.3)
	$"Sprite-3".rotate(0.2)
	
	$"Sprite-4".position.x = $"Sprite-4".position.x + 1
	$"Sprite-4".position.y = $"Sprite-4".position.y + ((time - 110)* -0.3)
	$"Sprite-4".rotate(-0.2)
	time = time - 1
	if time <= 1:
		queue_free()
	
