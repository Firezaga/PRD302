extends Node2D

var Name = "Verity"
var SpriteBattleFP = "res://Art/Characters/Verity/SideScroller/VerityIdle1.png"
var IconBattleFP = "res://Art/Characters/Verity/Battle/VerityBattleIcon.png"
var Lvl = 1
var SPMax = 10
var SP = 10
var Strength = 5
var T2_unlock = true
var T3_unlock = false
var T4_unlock = false
var VerityPassiveBoost = 0

var T1A1_name = "Boost ATK"
var T1A1_log = "Verity is boosting attack"
var T1A1_cost = 5
var T1A1_is_attack = true
func t1_a1(base):
	return base + (Strength*1.2)

var T1A2_unlock = true
var T1A2_name = "Boost DEF"
var T1A2_log = "Verity is boosting defense"
var T1A2_cost = 5
var T1A2_is_attack = false
func t1_a2(base):
	return base + (Strength*1.8)

var T1A3_unlock = false
var T1A3_name = "Placeholder"
var T1A3_log = "Placeholder"
var T1A3_cost = 5
var T1A3_is_attack = true
func t1_a3(base):
	return base + Strength

var T2A1_name = "Reflect"
var T2A1_log = "Verity prepares a thorny shield!"
var T2A1_cost = 5
var T2A1_is_attack = true
func t2_a1(base):
	#ok this one is complicated because it's based on if the enemy hits the player
	return base + Strength

var T2A2_unlock = false
var T2A2_name = "Burn"
var T2A2_log = "Verity prepares to throw a fireball!"
var T2A2_cost = 5
var T2A2_is_attack = true
func t2_a2(base):
	return base + Strength*2

var T2A3_unlock = false
var T2A3_name = "Placeholder"
var T2A3_log = "Placeholder"
var T2A3_cost = 5
var T2A3_is_attack = true
func t2_a3(base):
	return base + Strength

var T3A1_name = "Placeholder"
var T3A1_log = "Placeholder"
var T3A1_cost = 5
var T3A1_is_attack = true
func t3_a1(base):
	return base + Strength

var T3A2_unlock = false
var T3A2_name = "Placeholder"
var T3A2_log = "Placeholder"
var T3A2_cost = 5
var T3A2_is_attack = true
func t3_a2(base):
	return base + Strength

var T3A3_unlock = false
var T3A3_name = "Placeholder"
var T3A3_log = "Placeholder"
var T3A3_cost = 5
var T3A3_is_attack = true
func t3_a3(base):
	return base + Strength

var T4A1_name = "Placeholder"
var T4A1_log = "Placeholder"
var T4A1_cost = 5
var T4A1_is_attack = true
func t4_a1(base):
	return base + Strength

var T4A2_unlock = false
var T4A2_name = "Placeholder"
var T4A2_log = "Placeholder"
var T4A2_cost = 5
var T4A2_is_attack = true
func t4_a2(base):
	return base + Strength

var T4A3_unlock = false
var T4A3_name = "Placeholder"
var T4A3_log = "Placeholder"
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
