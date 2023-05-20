extends Node2D
var collected = 0
var vsp = -3
#refactor needed 

func _physics_process(delta):
	if collected == 1:
		$AnimatedSprite.position.y = $AnimatedSprite.position.y + vsp
		vsp = vsp + 0.25
		if vsp >= 3:
			queue_free()
	

func _on_Hcoin_body_entered(body):
	if collected == 0:
		globallevel.hcoin = globallevel.hcoin + 1
		if globallevel.hp == 24:
			globallevel.score = globallevel.score + 10
		else:
			globallevel.score = globallevel.score + 5
		collected =	1


