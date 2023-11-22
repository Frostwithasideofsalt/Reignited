extends AnimatedSprite
var time = 120
var typ 
func _ready():
	match(typ):
		0:
			$AnimatedSprite.play("0")
		1:
			$AnimatedSprite.play("1")
