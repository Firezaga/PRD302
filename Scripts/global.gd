extends Node

#region File Paths
var current_scene = null
var MainMenu = "res://Scenes/Menus/main_menu.tscn"
var Settings = "res://Scenes/Menus/settings.tscn"
var GameOver = "res://Scenes/Menus/game_over.tscn"
var TownTest = "res://Scenes/TownsEtc/town_test.tscn"
var OverworldTest = "res://Scenes/Overworld/overworld_test.tscn"
var UpgradeShop = "res://Scenes/Menus/upgrade.tscn"
var AlcoraFP = "res://Scenes/Player/alcora.tscn"
var BeoulFP = "res://Scenes/Player/beoul.tscn"
var ClaricoFP = "res://Scenes/Player/clarico.tscn"
var VerityFP = "res://Scenes/Player/verity.tscn"
#endregion

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

#region Companions
# Order
var Comp1 = null
var Comp2 = null
var Comp3 = null
var Comp4 = null

# Stored Nodes
var Alcora
var Beoul
var Clarico
var Verity
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

var Enemy = ""
var EnemyName = ""
var EnemyHealth = 0
var EnemyAttack = 0
var EnemyDefense = 0
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
	
	var node = load(AlcoraFP)
	Alcora = node.instantiate()
	
	node = load(BeoulFP)
	Beoul = node.instantiate()
	
	node = load(ClaricoFP)
	Clarico = node.instantiate()
	
	node = load(VerityFP)
	Verity = node.instantiate()
	
	# DEBUG --------------------------------------------------------------------
	Comp1 = Alcora
	Comp2 = Beoul
	Comp3 = Clarico
	Comp4 = Verity


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


func LOAD_upgrade_shop():
	var scene = load(UpgradeShop)
	var instance = scene.instantiate()
	current_scene.add_child(instance)
#endregion

#region Core Functions
func CORE_quit():
	get_tree().quit()


func CORE_pause():
	PlayerMove = false


func CORE_unpause():
	PlayerMove = true
#endregion

# Restart the application
func restart_application():
	var executable_path = OS.get_executable_path()
	OS.execute(executable_path, [])  # Pass any command line arguments if needed
	Global.CORE_quit()  # Quit the current instance of the application
