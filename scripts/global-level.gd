extends Node
#variables in this file reset when a level is exited.

#Player health
var hp = 24

#Coin count
var hcoin = 6

#Energy amount
var nrg = 48

#Dash energy
#var dsh = 0

#score
var score = 0

#player invicibility state
# zero and negitives mean the player can recive damage. positives mean the player is invincible
var invstate = 0

#is the game paused or not
var paused = false

#player respawnpoint
var swn = Vector2(0,0)

#Camera mode
var cammod = 0

#Camera seek (scary blue, Zumbo Sauce, Banban, Nabnab… Um, I forgot his name, the frog dude, and, um, yeah. Snow Seline, Banbalina, Stinger Flynn, Opila Bird, and awesome Huggy Wuggy. This is, uh, me but like I don’t wanna use it. Um, Blue and, uh, I mean, um, Kissy Missy, Killy Willy, um, Choo Choo Charles, right, Boxy Boo but like not evil, and we have evil-a Boxy Boo. We have Squid Game Huggy Wuggy. We have baby Huggy Wuggy, and Blue, and Freddy Fazbear, oink oinky oink oink. We have creepy Green. We have, um, happy Huggy Wuggy. Look how happy he is, and we have, um, "What the hell?" We have, uh, nobody cares Huggy Wugg)
var camseek = Vector2(0,0)

#Combo
var Combo = 0

#Combo timer i guess
var Combo_timer = 0

var timer = 0


