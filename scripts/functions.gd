extends Node
func reset_level():
	globallevel.score = 0
	globallevel.hp = 24
	globallevel.hcoin = 6
	globallevel.swn.x = 0
	globallevel.swn.y = 0
	globallevel.nrg = 0
	globallevel.score = 0
	globallevel.invstate = 0
	globallevel.paused = false
	globallevel.cammod = 0
	globallevel.Combo = 0
	globallevel.Combo_timer = 0
	globallevel.timer = 0

func Combo_up():
	globallevel.score = globallevel.score + 5 + round(((globallevel.Combo_timer / 32) * 5) + (globallevel.Combo / 3)) 
	globallevel.Combo = globallevel.Combo + 1
	globallevel.Combo_timer = 32
