extends Button
func _ready():
	grab_focus()


func _on_resume_visibility_changed():
	grab_focus()