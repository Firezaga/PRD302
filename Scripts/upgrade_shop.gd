extends Control

@onready var back = $Control/BackgroundBlur

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#region Menu Navigation
func _on_back_button_pressed():
	back.reparent($Control)
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
	$FirstMenu2.visible = true
	$FirstMenu2/Comp1.visible = true


func _on_comp_2_button_pressed():
	back.reparent($FirstMenu)
	$FirstMenu2.visible = true
	$FirstMenu2/Comp2.visible = true


func _on_comp_3_button_pressed():
	back.reparent($FirstMenu)
	$FirstMenu2.visible = true
	$FirstMenu2/Comp3.visible = true


func _on_comp_4_button_pressed():
	back.reparent($FirstMenu)
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



func _on_debug_curr_button_pressed():
	Global.PlayerCurrency += 20
	$FirstMenu2/Extor/Currency.text = "Currency: " + str(Global.PlayerCurrency)
