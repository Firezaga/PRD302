extends CanvasLayer

@onready var back = $Control/BackgroundBlur

# Called when the node enters the scene tree for the first time.
func _ready():
	$FirstMenu/Comp1Button/Label.text = Global.Comp1.Name
	$FirstMenu/Comp2Button/Label.text = Global.Comp2.Name
	$FirstMenu/Comp3Button/Label.text = Global.Comp3.Name
	$FirstMenu/Comp4Button/Label.text = Global.Comp4.Name
	$FirstMenu/GLBLLVL.text = "Global LVL: " + str(Global.PlayerLvl + Global.Alcora.Lvl + Global.Beoul.Lvl + Global.Clarico.Lvl + Global.Verity.Lvl)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#region Menu Navigation
func _on_back_button_pressed():
	back.reparent($Control)
	$FirstMenu/GLBLLVL.text = "Global LVL: " + str(Global.PlayerLvl + Global.Alcora.Lvl + Global.Beoul.Lvl + Global.Clarico.Lvl + Global.Verity.Lvl)
	$FirstMenu2.visible = false
	$FirstMenu2/Extor.visible = false
	$FirstMenu2/Comp1.visible = false
	$FirstMenu2/Comp2.visible = false
	$FirstMenu2/Comp3.visible = false
	$FirstMenu2/Comp4.visible = false


func _on_extor_button_pressed():
	back.reparent($FirstMenu)
	$FirstMenu2.visible = true
	$FirstMenu2/Extor.visible = true
	$FirstMenu2/Extor/LVL.text = "LVL: " + str(Global.PlayerLvl)
	$FirstMenu2/Extor/Currency.text = "Currency: " + str(Global.PlayerCurrency)
	$FirstMenu2/Extor/Health.text = "Health: " + str(Global.PlayerMaxHealth)
	$FirstMenu2/Extor/Damage.text = "Damage: " + str(Global.PlayerAttack)
	$FirstMenu2/Extor/SP.text = "SP: " + str(Global.PlayerAP)


func _on_comp_1_button_pressed():
	back.reparent($FirstMenu)
	$FirstMenu2/Comp1/Name.text = Global.Comp1.Name
	$FirstMenu2/Comp1/Lvl.text = "LVL: " + str(Global.Comp1.Lvl)
	$FirstMenu2/Comp1/Currency.text = "Currency: " + str(Global.PlayerCurrency)
	$FirstMenu2/Comp1/AbilityStrength.text = "Ability Strength: " + str(Global.Comp1.Strength)
	$FirstMenu2/Comp1/SP.text = "SP: " + str(Global.Comp1.SP)
	
	$FirstMenu2.visible = true
	$FirstMenu2/Comp1.visible = true
	


func _on_comp_2_button_pressed():
	back.reparent($FirstMenu)
	$FirstMenu2/Comp2/Name.text = Global.Comp2.Name
	$FirstMenu2/Comp2/Lvl.text = "LVL: " + str(Global.Comp2.Lvl)
	$FirstMenu2/Comp2/Currency.text = "Currency: " + str(Global.PlayerCurrency)
	$FirstMenu2/Comp2/AbilityStrength.text = "Ability Strength: " + str(Global.Comp2.Strength)
	$FirstMenu2/Comp2/SP.text = "SP: " + str(Global.Comp2.SP)
	
	$FirstMenu2.visible = true
	$FirstMenu2/Comp2.visible = true


func _on_comp_3_button_pressed():
	back.reparent($FirstMenu)
	$FirstMenu2/Comp3/Name.text = Global.Comp3.Name
	$FirstMenu2/Comp3/Lvl.text = "LVL: " + str(Global.Comp3.Lvl)
	$FirstMenu2/Comp3/Currency.text = "Currency: " + str(Global.PlayerCurrency)
	$FirstMenu2/Comp3/AbilityStrength.text = "Ability Strength: " + str(Global.Comp3.Strength)
	$FirstMenu2/Comp3/SP.text = "SP: " + str(Global.Comp3.SP)
	
	$FirstMenu2.visible = true
	$FirstMenu2/Comp3.visible = true


func _on_comp_4_button_pressed():
	back.reparent($FirstMenu)
	$FirstMenu2/Comp4/Name.text = Global.Comp4.Name
	$FirstMenu2/Comp4/Lvl.text = "LVL: " + str(Global.Comp4.Lvl)
	$FirstMenu2/Comp4/Currency.text = "Currency: " + str(Global.PlayerCurrency)
	$FirstMenu2/Comp4/AbilityStrength.text = "Ability Strength: " + str(Global.Comp4.Strength)
	$FirstMenu2/Comp4/SP.text = "SP: " + str(Global.Comp4.SP)
	
	$FirstMenu2.visible = true
	$FirstMenu2/Comp4.visible = true
#endregion


#region Extor Upgrades
func _on_health_button_pressed():
	if (Global.PlayerCurrency >= 5):
		Global.PlayerCurrency -= 5
		Global.PlayerMaxHealth += 50
		Global.PlayerLvl += 1
		$FirstMenu2/Extor/Currency.text = "Currency: " + str(Global.PlayerCurrency)
		$FirstMenu2/Extor/Health.text = "Health: " + str(Global.PlayerMaxHealth)
		$FirstMenu2/Extor/LVL.text = "LVL: " + str(Global.PlayerLvl)


func _on_damage_button_pressed():
	if (Global.PlayerCurrency >= 5):
		Global.PlayerCurrency -= 5
		Global.PlayerAttack += 10
		Global.PlayerLvl += 1
		$FirstMenu2/Extor/Currency.text = "Currency: " + str(Global.PlayerCurrency)
		$FirstMenu2/Extor/Damage.text = "Damage: " + str(Global.PlayerAttack)
		$FirstMenu2/Extor/LVL.text = "LVL: " + str(Global.PlayerLvl)


func _on_sp_button_pressed():
	if (Global.PlayerCurrency >= 5):
		Global.PlayerCurrency -= 5
		Global.PlayerAP += 5
		Global.PlayerLvl += 1
		$FirstMenu2/Extor/Currency.text = "Currency: " + str(Global.PlayerCurrency)
		$FirstMenu2/Extor/SP.text = "SP: " + str(Global.PlayerAP)
		$FirstMenu2/Extor/LVL.text = "LVL: " + str(Global.PlayerLvl)


#endregion


#region Comp1 Upgrades
func _on_strength_1_button_pressed():
	if (Global.PlayerCurrency >= 5):
		Global.PlayerCurrency -= 5
		Global.Comp1.Strength += 5
		Global.Comp1.Lvl += 1
		$FirstMenu2/Comp1/Currency.text = "Currency: " + str(Global.PlayerCurrency)
		$FirstMenu2/Comp1/AbilityStrength.text = "Ability Strength: " + str(Global.Comp1.Strength)
		$FirstMenu2/Comp1/Lvl.text = "LVL: " + str(Global.Comp1.Lvl)


func _on_sp_1_button_pressed():
	if (Global.PlayerCurrency >= 5):
		Global.PlayerCurrency -= 5
		Global.Comp1.SP += 10
		Global.Comp1.Lvl += 1
		$FirstMenu2/Comp1/Currency.text = "Currency: " + str(Global.PlayerCurrency)
		$FirstMenu2/Comp1/SP.text = "SP: " + str(Global.Comp1.SP)
		$FirstMenu2/Comp1/Lvl.text = "LVL: " + str(Global.Comp1.Lvl)
		
#endregion


#region Comp2 Upgrades
func _on_strength_2_button_pressed():
	if (Global.PlayerCurrency >= 5):
		Global.PlayerCurrency -= 5
		Global.Comp2.Strength += 5
		Global.Comp2.Lvl += 1
		$FirstMenu2/Comp2/Currency.text = "Currency: " + str(Global.PlayerCurrency)
		$FirstMenu2/Comp2/AbilityStrength.text = "Ability Strength: " + str(Global.Comp2.Strength)
		$FirstMenu2/Comp2/Lvl.text = "LVL: " + str(Global.Comp2.Lvl)


func _on_sp_2_button_pressed():
	if (Global.PlayerCurrency >= 5):
		Global.PlayerCurrency -= 5
		Global.Comp2.SP += 10
		Global.Comp2.Lvl += 1
		$FirstMenu2/Comp2/Currency.text = "Currency: " + str(Global.PlayerCurrency)
		$FirstMenu2/Comp2/SP.text = "SP: " + str(Global.Comp2.SP)
		$FirstMenu2/Comp2/Lvl.text = "LVL: " + str(Global.Comp2.Lvl)
		
#endregion


#region Comp3 Upgrades
func _on_strength_3_button_pressed():
	if (Global.PlayerCurrency >= 5):
		Global.PlayerCurrency -= 5
		Global.Comp3.Strength += 5
		Global.Comp3.Lvl += 1
		$FirstMenu2/Comp3/Currency.text = "Currency: " + str(Global.PlayerCurrency)
		$FirstMenu2/Comp3/AbilityStrength.text = "Ability Strength: " + str(Global.Comp3.Strength)
		$FirstMenu2/Comp3/Lvl.text = "LVL: " + str(Global.Comp3.Lvl)


func _on_sp_3_button_pressed():
	if (Global.PlayerCurrency >= 5):
		Global.PlayerCurrency -= 5
		Global.Comp3.SP += 10
		Global.Comp3.Lvl += 1
		$FirstMenu2/Comp3/Currency.text = "Currency: " + str(Global.PlayerCurrency)
		$FirstMenu2/Comp3/SP.text = "SP: " + str(Global.Comp3.SP)
		$FirstMenu2/Comp3/Lvl.text = "LVL: " + str(Global.Comp3.Lvl)
		
#endregion


#region Comp1 Upgrades
func _on_strength_4_button_pressed():
	if (Global.PlayerCurrency >= 5):
		Global.PlayerCurrency -= 5
		Global.Comp4.Strength += 5
		Global.Comp4.Lvl += 1
		$FirstMenu2/Comp4/Currency.text = "Currency: " + str(Global.PlayerCurrency)
		$FirstMenu2/Comp4/AbilityStrength.text = "Ability Strength: " + str(Global.Comp4.Strength)
		$FirstMenu2/Comp4/Lvl.text = "LVL: " + str(Global.Comp4.Lvl)


func _on_sp_4_button_pressed():
	if (Global.PlayerCurrency >= 5):
		Global.PlayerCurrency -= 5
		Global.Comp4.SP += 10
		Global.Comp4.Lvl += 1
		$FirstMenu2/Comp4/Currency.text = "Currency: " + str(Global.PlayerCurrency)
		$FirstMenu2/Comp4/SP.text = "SP: " + str(Global.Comp4.SP)
		$FirstMenu2/Comp4/Lvl.text = "LVL: " + str(Global.Comp4.Lvl)
		
#endregion


func _on_debug_curr_button_pressed():
	Global.PlayerCurrency += 20
	$FirstMenu2/Extor/Currency.text = "Currency: " + str(Global.PlayerCurrency)


func _on_exit_button_pressed():
	Global.PlayerMove = true
	queue_free()






