extends Node2D
var vsp = Vector2()
var time = 120

func _ready():
	vsp.y = -4

func _physics_process(delta):
	vsp.y = vsp.y + 0.25
	position.y = position.y + vsp.y
	position.x = position.x + vsp.x
	rotate(vsp.x / 12)
