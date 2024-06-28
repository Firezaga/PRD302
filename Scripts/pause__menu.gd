extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_main_menu_button_pressed():
	Global.GOTO_main_menu()


func _on_resume_button_pressed():
	Global.CORE_unpause()
	$".".visible = false


func _on_quit_button_pressed():
	Global.CORE_quit()


func _on_save_button_pressed():
	Global.CORE_save_game()

func refresh():
	$Currency.text = "Currency: " + str(Global.PlayerCurrency)
	$ExtorReg/PlayerHealth.max_value = Global.PlayerMaxHealth
	$ExtorReg/PlayerHealth.value = Global.PlayerCurHealth
	$Label.text = str(Global.PlayerCurHealth) + "/" + str(Global.PlayerMaxHealth)
	$ExtorReg/Lvl.text = "Lvl: " + str(Global.PlayerLvl)
	$ExtorReg/AP.text = "SP: " + str(Global.PlayerAPCur) + "/" + str(Global.PlayerAPMax)
	$ExtorReg/Attack.text ="Attack: " + str(Global.PlayerAttack)
	$ExtorReg/Defense.text = "Defense: " + str(Global.PlayerDefense)
	$Comp1Reg/Name.text = Global.Comp1.Name
	$Comp1Reg/Lvl.text = "Lvl: " + str(Global.Comp1.Lvl)
	$Comp1Reg/AP.text = "SP: " + str(Global.Comp1.SP) + "/" + str(Global.Comp1.SPMax)
	$Comp1Reg/Strength.text = "Strength: " + str(Global.Comp1.Strength)
	$Comp2Reg/Name.text = Global.Comp2.Name
	$Comp2Reg/Lvl.text = "Lvl: " + str(Global.Comp2.Lvl)
	$Comp2Reg/AP.text = "SP: " + str(Global.Comp2.SP) + "/" + str(Global.Comp2.SPMax)
	$Comp2Reg/Strength.text = "Strength: " + str(Global.Comp2.Strength)
	$Comp3Reg/Name.text = Global.Comp3.Name
	$Comp3Reg/Lvl.text = "Lvl: " + str(Global.Comp3.Lvl)
	$Comp3Reg/AP.text = "SP: " + str(Global.Comp3.SP) + "/" + str(Global.Comp3.SPMax)
	$Comp3Reg/Strength.text = "Strength: " + str(Global.Comp3.Strength)
	$Comp4Reg/Name.text = Global.Comp4.Name
	$Comp4Reg/Lvl.text = "Lvl: " + str(Global.Comp4.Lvl)
	$Comp4Reg/AP.text = "SP: " + str(Global.Comp4.SP) + "/" + str(Global.Comp4.SPMax)
	$Comp4Reg/Strength.text = "Strength: " + str(Global.Comp4.Strength)
