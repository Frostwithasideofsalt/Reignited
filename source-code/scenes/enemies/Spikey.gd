extends KinematicBody2D
#enemy's velocity
var vsp = Vector2()
#enemy's direction
var dir = 1
#is this enemy alive
var lfe = 1
#this dictates how long the enemy falls after death
var fall = 60
const enemydead = preload("res://scenes/enemies/enemy-dead.tscn")
func _physics_process(delta):
	if lfe == 1:
		pass
	else:
		globallevel.score = globallevel.score + 5
		var a = enemydead.instance()
		a.vsp.x = 2
		a.typ = 2
		get_parent().add_child(a)
		a.position = position
		queue_free()
	vsp = move_and_slide(vsp,Vector2.UP)


# warning-ignore:unused_argument


func _on_Hitboxplayer_body_entered(body):
	if globallevel.invstate <= 1:
		globallevel.score = globallevel.score - 50
		globallevel.hp = globallevel.hp - 4
		globallevel.invstate = 60


func _on_Hitboxprojectile_body_entered(body):
	lfe = 0
