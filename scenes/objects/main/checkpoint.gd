extends Area2D

func _physics_process(delta):
	if globallevel.swn == Vector2(self.position.x,self.position.y):
			$AnimatedSprite.play("on")
	else:
			$AnimatedSprite.play("off")
			
func _on_Area2D_body_entered(body):
	globallevel.swn = Vector2(self.position.x,self.position.y)
	globallevel.Combo_timer = 32
	$checkpoint_audio.playing = true
