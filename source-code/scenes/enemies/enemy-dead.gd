extends Node2D
var vsp = Vector2()
var time = 120
var typ 
func _ready():
	vsp.y = -4
	match(typ):
		0:
			$AnimatedSprite.play("0")
		1:
			$AnimatedSprite.play("1")
		2:
			$AnimatedSprite.play("2")

func _physics_process(delta):
	vsp.y = vsp.y + 0.25
	position.y = position.y + vsp.y
	position.x = position.x + vsp.x
	rotate(vsp.x / 12)
