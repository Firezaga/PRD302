extends Node2D

var Name = "Alcora"
var SpriteBattleFP = "res://Art/Characters/Alcora/Sidescroller/AlcoraIdle1.png"
var IconBattleFP = "res://Art/Characters/Alcora/Battle/AlcoraBattleIcon.png"
var Lvl = 1
var SPMax = 10
var SP = 10
var Strength = 5
var T2_unlock = true
var T3_unlock = true
var T4_unlock = true

var T1A1_name = "Boost ATK"
var T1A1_log = "Alcora is boosting attack"
var T1A1_cost = 5
var T1A1_is_attack = true
func t1_a1(base):
	return base + Strength

var T1A2_unlock = true
var T1A2_name = "T1A2"
var T1A2_log = "T1A2"
var T1A2_cost = 5
var T1A2_is_attack = true
func t1_a2(base):
	return base + Strength

var T1A3_unlock = true
var T1A3_name = "T1A3"
var T1A3_log = "T1A3"
var T1A3_cost = 5
var T1A3_is_attack = true
func t1_a3(base):
	return base + Strength

var T2A1_name = "Coin Flip"
var T2A1_log = "Alcora flips a coin..."
var T2A1_cost = 15
var T2A1_is_attack = true
func t2_a1(base):
	var coinflip = (randi()%2)
	if coinflip == 1:
		return base + (Strength*10)
		#print success!
	else:
		return base
		#print fail sadge

var T2A2_unlock = true
var T2A2_name = "Full House"
var T2A2_log = "Alcora bets high, and prays for fortune!"
var T2A2_cost = 15
var T2A2_is_attack = true
func t2_a2(base):
	var AlcoraT2A2chance = (randi()%100)
	if AlcoraT2A2chance == range(0,19):
		return base + (Strength*20)
		#Alcora gets what she wants!
	elif AlcoraT2A2chance == range(20,60):
		return base + (Strength*2)
		#Alcora lost the bet, but got some back!
	else:
		return base + (Strength*0.1)
		#Alcora completely lost the bet...

var T2A3_unlock = true
var T2A3_name = "Placehoder"
var T2A3_log = "Placholder"
var T2A3_cost = 5
var T2A3_is_attack = true

var T3A1_name = "Plaeholder"
var T3A1_log = "Placehoder"
var T3A1_cost = 5
var T3A1_is_attack = true

var T3A2_unlock = true
var T3A2_name = "Placehlder"
var T3A2_log = "Placeolder"
var T3A2_cost = 5
var T3A2_is_attack = true

var T3A3_unlock = true
var T3A3_name = "Placeholer"
var T3A3_log = "Placehoder"
var T3A3_cost = 5
var T3A3_is_attack = true

var T4A1_name = "Placehlder"
var T4A1_log = "Placeolder"
var T4A1_cost = 5
var T4A1_is_attack = true

var T4A2_unlock = true
var T4A2_name = "Placholder"
var T4A2_log = "Placeolder"
var T4A2_cost = 5
var T4A2_is_attack = true

var T4A3_unlock = true
var T4A3_name = "Placehoder"
var T4A3_log = "Placehoder"
var T4A3_cost = 5
var T4A3_is_attack = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func t2_a3(base):
	return base + Strength

func t3_a1(base):
	return base + Strength

func t3_a2(base):
	return base + Strength

func t3_a3(base):
	return base + Strength

func t4_a1(base):
	return base + Strength

func t4_a2(base):
	return base + Strength

func t4_a3(base):
	return base + Strength
	
