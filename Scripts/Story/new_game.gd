extends Node2D


var DiaCount = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.BackgroundAudioChange("res://Audio/Background Audio/dialog.mp3")
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
	Global.DiaFinished = false
	
	Global.DiaBackground = "res://Art/StoryScenes/Act0/Act0BG.png"
	Global.DiaText = "???: A new threat looms upon us. You will be summoned to the Planar of Reality with one main purpose.~???: To destroy the threats of Annihilation.%"
	Global.LOAD_dialogue()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (Global.DiaFinished && DiaCount == 0):
		Global.DiaFinished = false
		Dia2()
	if (Global.DiaFinished && DiaCount == 1):
		Global.DiaFinished = false
		Global.GOTO_movement_tutorial()

func Dia2():
	Global.DiaBackground = "res://Art/StoryScenes/Act0/Act0BG.png"
	Global.DiaText = "???: I will brief you with all you need to know. Please remember this throughout your journey.~MOAT: I am Moat, an Annihilation Averter. You are Extor, my summon to destroy the threats that seeks destruction. The persons you saw on my side are the people who seek destruction of all things, and your purpose will be to stop them.~MOAT: In order to succeed, you will require others by your side to join your cause. I will soon bring you near them. It will be up to you to state your purpose. Good luck.%"
	await Global.LOAD_dialogue()
	DiaCount += 1
