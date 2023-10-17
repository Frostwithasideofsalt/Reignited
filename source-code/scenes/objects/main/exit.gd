extends Node2D
var can_exit = false

#will add a LOT more later lmao
func _on_Area2D_body_entered(body):
	can_exit = true
	if globalsetting.control_hints == true:
		$placetext.text = " press up to exit"
func _on_Area2D_body_exited(body):
	can_exit = false
	$placetext.text = ""

func _physics_process(_delta):
	if Input.is_action_pressed("ui_up") and can_exit == true:
		get_tree().change_scene("res://scenes/Main.tscn")
