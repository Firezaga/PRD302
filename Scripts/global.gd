extends Node

# Paths to different scenes and scene changing variables
var current_scene = null
var MainMenu = "res://Scenes/Menus/main_menu.tscn"
var Settings = "res://Scenes/Menus/settings.tscn"
var GameOver = "res://Scenes/Menus/game_over.tscn"
var TownTest = "res://Scenes/TownsEtc/town_test.tscn"
var OverworldTest = "res://Scenes/Overworld/overworld_test.tscn"

#region Character variables
#region Basic Stats - (Name, Health, Attack, Defense)
var PlayerName = "Test"
var PlayerMaxHealth = 200
var PlayerCurHealth = 200
var PlayerAttack = 50
var PlayerAP = 1
var PlayerStartingAP = 1
var PlayerDefense = 0
var PlayerStoryState = 0
var PlayerMove = true
#endregion

#region Leveling
var PlayerLvl = 1
#endregion

#region Weapons
var PlayerWeapon1 = ""
var PlayerWeapon1Name = null
var PlayerWeapon1Attack = null
var PlayerWeapon1Defense = null
var PlayerWeapon2 = ""
var PlayerWeapon2Name = null
var PlayerWeapon2Attack = null
var PlayerWeapon2Defense = null
var PlayerWeapon3 = ""
var PlayerWeapon3Name = null
var PlayerWeapon3Attack = null
var PlayerWeapon3Defense = null
var PlayerWeapon4 = ""
var PlayerWeapon4Name = null
var PlayerWeapon4Attack = null
var PlayerWeapon4Defense = null
#endregion

#region Misc
var PlayerCurrency = 15
var PlayerPotion = 5
var PlayerLocX = 0
var PlayerLocY = 0
#endregion
#endregion

#region Enemy variables
var EnemyNumberOf = 0

var Enemy1 = ""
var Enemy1Name = ""
var Enemy1Health = 0
var Enemy1Attack = 0
var Enemy1Defense = 0

var Enemy2 = ""
var Enemy2Name = ""
var Enemy2Health = 0
var Enemy2Attack = 0
var Enemy2Defense = 0

var Enemy3 = ""
var Enemy3Name = ""
var Enemy3Health = 0
var Enemy3Attack = 0
var Enemy3Defense = 0

var Enemy4 = ""
var Enemy4Name = ""
var Enemy4Health = 0
var Enemy4Attack = 0
var Enemy4Defense = 0
#endregion

#region Dialogue variables
var DiaBackground = "res://Art/BlakeTest/PH-Background(AI).png"
var DiaSpriteRight = "res://Art/BlakeTest/PH-Sprite1(AI).jpg"
var DiaSpriteLeft = "res://Art/BlakeTest/PH-Sprite2(AI).jpg"
var DiaText = "^Placeholder text for the start of the conversation.~Pain in the fucking ass to get working.~@^Button 1 Placehold^Button 2 Placehold^Button 3 Placehold^Reply 1~Had worse experiences~^Reply 2~Second response~^Reply 3~Does this work?~^"
#endregion


# Called when the node enters the scene tree for the first time.
func _ready():
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() - 1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


#region Scene Change Functions
func goto_scene(path):
	# This function will usually be called from a signal callback,
	# or some other function in the current scene.
	# Deleting the current scene at this point is
	# a bad idea, because it may still be executing code.
	# This will result in a crash or unexpected behavior.

	# The solution is to defer the load to a later time, when
	# we can be sure that no code from the current scene is running:

	call_deferred("_deferred_goto_scene", path)


func _deferred_goto_scene(path):
	# It is now safe to remove the current scene
	current_scene.free()
	
	# Load the new scene.
	var s = ResourceLoader.load(path)
	
	# Instance the new scene.
	current_scene = s.instantiate()
	
	# Add it to the active scene, as child of root.
	get_tree().get_root().add_child(current_scene)
	
	# Optionally, to make it compatible with the SceneTree.change_scene() API.
	get_tree().set_current_scene(current_scene)


func GOTO_main_menu():
	goto_scene(MainMenu)


func GOTO_settings():
	goto_scene(Settings)


func GOTO_game_over():
	goto_scene(GameOver)

func GOTO_town_test():
	goto_scene(TownTest)


func GOTO_overworld_test():
	goto_scene(OverworldTest)
#endregion

#region Core Functions
func CORE_quit():
	get_tree().quit()


func CORE_pause():
	PlayerMove = false


func CORE_unpause():
	PlayerMove = true
#endregion

