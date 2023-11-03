extends Area2D
func _on_Area2D_body_entered(body):
	globallevel.swn = Vector2(self.position.x,self.position.y)
	queue_free()
