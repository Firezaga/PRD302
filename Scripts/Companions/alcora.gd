extends Node2D

var Name = "Alcora"
var SpriteBattleFP = "res://Art/BlakeTest/Comp1.png"
var IconBattleFP = "res://Art/BlakeTest/Comp1.png"
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

var T1A2_unlock = true
var T1A2_name = "T1A2"
var T1A2_log = "T1A2"
var T1A2_cost = 5
var T1A2_is_attack = true

var T1A3_unlock = true
var T1A3_name = "T1A3"
var T1A3_log = "T1A3"
var T1A3_cost = 5
var T1A3_is_attack = true

var T2A1_name = "T2A1"
var T2A1_log = "T2A1"
var T2A1_cost = 5
var T2A1_is_attack = true

var T2A2_unlock = true
var T2A2_name = "Placeholde"
var T2A2_log = "Placeholde"
var T2A2_cost = 5
var T2A2_is_attack = true

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

func t1_a1(base):
	return base + Strength

func t1_a2(base):
	return base + Strength

func t1_a3(base):
	return base + Strength

func t2_a1(base):
	return base + Strength

func t2_a2(base):
	return base + Strength

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
