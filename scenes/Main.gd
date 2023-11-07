extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _physics_process(delta):
	if Input.is_action_just_pressed("action-2"):
		$FileDialog.popup()
