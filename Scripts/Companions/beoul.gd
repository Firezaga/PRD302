extends Node2D

var Name = "Beoul"
var SpriteBattleFP = "res://Art/Characters/Beoul/Sidescroller/BeoulIdle1.png"
var IconBattleFP = "res://Art/Characters/Beoul/Battle/BeoulBattleIcon.png"
var Lvl = 1
var SPMax = 10
var SP = 10
var Strength = 5
var T2_unlock = true
var T3_unlock = true
var T4_unlock = true

var T1A1_name = "Boost ATK"
var T1A1_log = "Beoul is boosting attack"
var T1A1_cost = 5
var T1A1_is_attack = true
func t1_a1(base):
	return base + Strength

var T1A2_unlock = true
var T1A2_name = "Placehoder"
var T1A2_log = "Plaeholder"
var T1A2_cost = 5
var T1A2_is_attack = true
func t1_a2(base):
	return base + Strength

var T1A3_unlock = true
var T1A3_name = "Placholder"
var T1A3_log = "Placeholer"
var T1A3_cost = 5
var T1A3_is_attack = true
func t1_a3(base):
	return base + Strength

var T2A1_name = "Plceholder"
var T2A1_log = "Placeholer"
var T2A1_cost = 5
var T2A1_is_attack = true
func t2_a1(base):
	return base + Strength

var T2A2_unlock = true
var T2A2_name = "Placholder"
var T2A2_log = "Placehoder"
var T2A2_cost = 5
var T2A2_is_attack = true
func t2_a2(base):
	return base + Strength

var T2A3_unlock = true
var T2A3_name = "Placehlder"
var T2A3_log = "Plaeholder"
var T2A3_cost = 5
var T2A3_is_attack = true
func t2_a3(base):
	return base + Strength

var T3A1_name = "Placehoder"
var T3A1_log = "Placholder"
var T3A1_cost = 5
var T3A1_is_attack = true
func t3_a1(base):
	return base + Strength

var T3A2_unlock = true
var T3A2_name = "Placehoder"
var T3A2_log = "Placholder"
var T3A2_cost = 5
var T3A2_is_attack = true
func t3_a2(base):
	return base + Strength

var T3A3_unlock = true
var T3A3_name = "Placeolder"
var T3A3_log = "Plaeholder"
var T3A3_cost = 5
var T3A3_is_attack = true
func t3_a3(base):
	return base + Strength

var T4A1_name = "Placeholer"
var T4A1_log = "Placeolder"
var T4A1_cost = 5
var T4A1_is_attack = true
func t4_a1(base):
	return base + Strength

var T4A2_unlock = true
var T4A2_name = "Placeolder"
var T4A2_log = "Placholder"
var T4A2_cost = 5
var T4A2_is_attack = true
func t4_a2(base):
	return base + Strength

var T4A3_unlock = true
var T4A3_name = "Placehoder"
var T4A3_log = "Placeolder"
var T4A3_cost = 5
var T4A3_is_attack = true
func t4_a3(base):
	return base + Strength

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
