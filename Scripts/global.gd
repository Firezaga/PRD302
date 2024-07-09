extends Node

#region File Paths
var current_scene = null
var MainMenu = "res://Scenes/Menus/main_menu.tscn"
var Settings = "res://Scenes/Menus/settings.tscn"
var GameOver = "res://Scenes/Menus/game_over.tscn"
var Battle = "res://Scenes/Battle/battle.tscn"
var TownTest = "res://Scenes/TownsEtc/town_test.tscn"
var OverworldTest = "res://Scenes/Overworld/overworld_test.tscn"
var UpgradeShop = "res://Scenes/Menus/upgrade.tscn"
var NewGame = "res://Scenes/Story/new_game.tscn"
var MovTut = "res://Scenes/TownsEtc/movement_tutorial.tscn"
var BattleTut = "res://Scenes/Battle/battle_tutorial.tscn"
var ProEnd = "res://Scenes/Story/prologue_end.tscn"
var Dialogue = "res://Scenes/Menus/dialogue.tscn"
var AlcoraFP = "res://Scenes/Player/alcora.tscn"
var BeoulFP = "res://Scenes/Player/beoul.tscn"
var ClaricoFP = "res://Scenes/Player/clarico.tscn"
var VerityFP = "res://Scenes/Player/verity.tscn"

var DEBUGEnemyFP = "res://Scenes/Enemies/enemy_test.tscn"
#endregion

#region Character variables
#region Basic Stats - (Name, Health, Attack, Defense)
var PlayerName = "Test"
var PlayerMaxHealth = 200
var PlayerCurHealth = 200
var PlayerAttack = 50
var PlayerAPMax = 100
var PlayerAPCur = 100
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
var Enemy
#endregion

#region Dialogue variables
var DiaFinished = false
var DiaBackground = ""
var DiaSpriteRight = ""
var DiaSpriteLeft = ""
var DiaText = "^Placeholder text for the start of the conversation.~Pain in the fucking ass to get working.~@^Button 1 Placehold^Button 2 Placehold^Button 3 Placehold^Reply 1~Had worse experiences%^Reply 2~Second response%^Reply 3~Does this work?%^"
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
	
	node = load("res://Scenes/Enemies/enemy_test.tscn")
	Enemy = node.instantiate()


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
	var scene = load(Settings)
	var instance = scene.instantiate()
	current_scene.add_child(instance)


func GOTO_game_over():
	goto_scene(GameOver)

func GOTO_town_test():
	goto_scene(TownTest)


func GOTO_overworld_test():
	goto_scene(OverworldTest)


func GOTO_new_game():
	goto_scene(NewGame)


func GOTO_movement_tutorial():
	goto_scene(MovTut)

func GOTO_prologue_end():
	goto_scene(ProEnd)

func LOAD_upgrade_shop():
	var scene = load(UpgradeShop)
	var instance = scene.instantiate()
	current_scene.add_child(instance)

func LOAD_battle(EnemyFP):
	var node = load(EnemyFP)
	Enemy = node.instantiate()
	var scene = load(Battle)
	var instance = scene.instantiate()
	current_scene.add_child(instance)

func LOAD_battle_tutorial():
	var node = load(DEBUGEnemyFP)
	Enemy = node.instantiate()
	var scene = load(BattleTut)
	var instance = scene.instantiate()
	current_scene.add_child(instance)

func LOAD_dialogue():
	var scene = load(Dialogue)
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

func CORE_refill_HPSP():
	PlayerCurHealth = PlayerMaxHealth
	PlayerAPCur = PlayerAPMax
	Comp1.SP = Comp1.SPMax
	Comp2.SP = Comp2.SPMax
	Comp3.SP = Comp3.SPMax
	Comp4.SP = Comp4.SPMax
	pass

func CORE_save_game():
	var save_dict = {
		"PlayerHealth" : PlayerMaxHealth,
		"PlayerAttack" : PlayerAttack,
		"PlayerAP" : PlayerAPMax,
		"PlayerDefense" : PlayerDefense,
		"StoryState" : PlayerStoryState,
		"PlayerLvl" : PlayerLvl,
		"PlayerCurrency" : PlayerCurrency,
		"AlcoraLvl" : Alcora.Lvl,
		"AlcoraSP" : Alcora.SPMax,
		"AlcoraStrangth" : Alcora.Strength,
		"AlcoraT2" : Alcora.T2_unlock,
		"AlcoraT3" : Alcora.T3_unlock,
		"AlcoraT4" : Alcora.T4_unlock,
		"BeoulLvl" : Beoul.Lvl,
		"BeoulSP" : Beoul.SPMax,
		"BeoulStrangth" : Beoul.Strength,
		"BeoulT2" : Beoul.T2_unlock,
		"BeoulT3" : Beoul.T3_unlock,
		"BeoulT4" : Beoul.T4_unlock,
		"ClaricoLvl" : Clarico.Lvl,
		"ClaricoSP" : Clarico.SPMax,
		"ClaricoStrangth" : Clarico.Strength,
		"ClaricoT2" : Clarico.T2_unlock,
		"ClaricoT3" : Clarico.T3_unlock,
		"ClaricoT4" : Clarico.T4_unlock,
		"VerityLvl" : Verity.Lvl,
		"VeritySP" : Verity.SPMax,
		"VerityStrangth" : Verity.Strength,
		"VerityT2" : Verity.T2_unlock,
		"VerityT3" : Verity.T3_unlock,
		"VerityT4" : Verity.T4_unlock
	}
	
	var save_game = FileAccess.open("user://savegame.save", FileAccess.WRITE)
	var json_string = JSON.stringify(save_dict)
	
	save_game.store_line(json_string)
	print("Saving Finished")

func CORE_load_game():
	if not FileAccess.file_exists("user://savegame.save"):
		return
	
	var save_game = FileAccess.open("user://savegame.save", FileAccess.READ)
	var json = JSON.new()
	
	var parse_result = json.parse(save_game.get_line())
	if not parse_result == OK:
		print("JSON Parse Error: ", json.get_error_message(), " in ", save_game.get_line(), " at line ", json.get_error_line())
	
	var save_data = json.get_data()
	PlayerMaxHealth = save_data["PlayerHealth"]
	PlayerAttack = save_data["PlayerAttack"]
	PlayerAPMax = save_data["PlayerAP"]
	PlayerDefense = save_data["PlayerDefense"]
	PlayerStoryState = save_data["StoryState"]
	PlayerLvl = save_data["PlayerLvl"]
	PlayerCurrency = save_data["PlayerCurrency"]
	Alcora.Lvl = save_data["AlcoraLvl"]
	Alcora.SPMax = save_data["AlcoraSP"]
	Alcora.Strength = save_data["AlcoraStrangth"]
	Alcora.T2_unlock = save_data["AlcoraT2"]
	Alcora.T3_unlock = save_data["AlcoraT3"]
	Alcora.T4_unlock = save_data["AlcoraT4"]
	Beoul.Lvl = save_data["BeoulLvl"]
	Beoul.SPMax = save_data["BeoulSP"]
	Beoul.Strength = save_data["BeoulStrangth"]
	Beoul.T2_unlock = save_data["BeoulT2"]
	Beoul.T3_unlock = save_data["BeoulT3"]
	Beoul.T4_unlock = save_data["BeoulT4"]
	Clarico.Lvl = save_data["ClaricoLvl"]
	Clarico.SPMax = save_data["ClaricoSP"]
	Clarico.Strength = save_data["ClaricoStrangth"]
	Clarico.T2_unlock = save_data["ClaricoT2"]
	Clarico.T3_unlock = save_data["ClaricoT3"]
	Clarico.T4_unlock = save_data["ClaricoT4"]
	Verity.Lvl = save_data["VerityLvl"]
	Verity.SPMax = save_data["VeritySP"]
	Verity.Strength = save_data["VerityStrangth"]
	Verity.T2_unlock = save_data["VerityT2"]
	Verity.T3_unlock = save_data["VerityT3"]
	Verity.T4_unlock = save_data["VerityT4"]
	
	GOTO_town_test()


# Restart the application
func restart_application():
	var executable_path = OS.get_executable_path()
	OS.execute(executable_path, [])  # Pass any command line arguments if needed
	Global.CORE_quit()  # Quit the current instance of the application
