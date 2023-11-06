extends Area2D
var touched = false

func _physics_process(delta):
	if globallevel.swn == Vector2(self.position.x,self.position.y):
			$AnimatedSprite.play("on")
	else:
			$AnimatedSprite.play("off")
			
func _on_Area2D_body_entered(body):
	if touched == false:
		globallevel.swn = Vector2(self.position.x,self.position.y)
		globallevel.Combo_timer = 32
		$checkpoint_audio.playing = true
		touched = true
