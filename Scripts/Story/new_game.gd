extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.PlayerMaxHealth = 200
	Global.PlayerAttack = 50
	Global.PlayerAPMax = 50
	Global.PlayerDefense = 10
	Global.PlayerStoryState = 0
	Global.PlayerLvl = 1
	Global.PlayerCurrency = 0
	Global.Alcora.Lvl = 1
	Global.Alcora.SPMax = 10
	Global.Alcora.Strength = 5
	Global.Alcora.T2_unlock = false
	Global.Alcora.T3_unlock = false
	Global.Alcora.T4_unlock = false
	Global.Beoul.Lvl = 1
	Global.Beoul.SPMax = 10
	Global.Beoul.Strength = 5
	Global.Beoul.T2_unlock = false
	Global.Beoul.T3_unlock = false
	Global.Beoul.T4_unlock = false
	Global.Clarico.Lvl = 1
	Global.Clarico.SPMax = 10
	Global.Clarico.Strength = 5
	Global.Clarico.T2_unlock = false
	Global.Clarico.T3_unlock = false
	Global.Clarico.T4_unlock = false
	Global.Verity.Lvl = 1
	Global.Verity.SPMax = 10
	Global.Verity.Strength = 5
	Global.Verity.T2_unlock = false
	Global.Verity.T3_unlock = false
	Global.Verity.T4_unlock = false
	
	Global.DiaBackground = "res://Art/Overworld/OverworldSkyBG.png"
	Global.DiaText = "???: A new threat looms upon us. You will be summoned to the Planar of Reality with one main purpose.~???: To destroy the threats of Annihilation.%"
	Global.LOAD_dialogue()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
