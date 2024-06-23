extends CanvasLayer

var log_array = []

var enemy_current_health

var total_attack
var total_defense

#region Initialise all text and variables
func _ready():
	# Enemy
	$Enemy.texture = ResourceLoader.load(Global.Enemy.SpriteFP)
	enemy_current_health = Global.Enemy.MaxHP
	$HealthBars/EnemyHealth.max_value = enemy_current_health
	$HealthBars/EnemyHealth.set_value_no_signal(enemy_current_health)
	
	# Player
	$HealthBars/PlayerHealth.max_value = Global.PlayerMaxHealth
	$HealthBars/PlayerHealth.value = Global.PlayerCurHealth
	$Player/Comp1.texture = ResourceLoader.load(Global.Comp1.SpriteBattleFP)
	$Player/Comp2.texture = ResourceLoader.load(Global.Comp2.SpriteBattleFP)
	$Player/Comp3.texture = ResourceLoader.load(Global.Comp3.SpriteBattleFP)
	$Player/Comp4.texture = ResourceLoader.load(Global.Comp4.SpriteBattleFP)
	
	# Companions
	$TeamOrder/Slot1.texture = ResourceLoader.load(Global.Comp1.IconBattleFP)
	$TeamOrder/Slot2.texture = ResourceLoader.load(Global.Comp2.IconBattleFP)
	$TeamOrder/Slot3.texture = ResourceLoader.load(Global.Comp3.IconBattleFP)
	$TeamOrder/Slot4.texture = ResourceLoader.load(Global.Comp4.IconBattleFP)
	
	battle_start()

#endregion

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#region DEBUG
func _on_button_pressed():
	await log_process_text("TEST TEST TEST")
#endregion


#region Text Log
func log_process_text(text):
	$Log/Label.text = ""
	if log_array.size() == 15:
		log_array.pop_front()
	for i in log_array:
		$Log/Label.text += i + "\n"
	log_array.push_back(text)
	for i in len(text):
		$Log/Label.text += text[i]
		await get_tree().create_timer(0.01).timeout
#endregion


#region Enemy Turn

#endregion


#region Player Turn

#region Companion 1
func PT_Comp1():
	total_attack = Global.PlayerAttack
	total_defense = Global.PlayerDefense
	$TeamOrder/Label.text = Global.Comp1.Name + " SP: " + str(Global.Comp1.SP)
	$Buttons/Comp1/C1T1A1Button/Label.text = Global.Comp1.T1A1_name
	$Buttons/Comp1/SwapButtons.visible = false
	$Buttons/Comp1/C1T1Button.visible = true
	$Buttons/Comp1/C1T1A1Button.visible = true
	if Global.Comp1.T1A2_unlock:
		$Buttons/Comp1/C1T1A2Button/Label.text = Global.Comp1.T1A2_name
		$Buttons/Comp1/C1T1A2Button.visible = true
		if Global.Comp1.SP < Global.Comp1.T1A2_cost:
			$Buttons/Comp1/C1T1A2Button.disabled = true
		else:
			$Buttons/Comp1/C1T1A2Button.disabled = false
	if Global.Comp1.T1A3_unlock:
		$Buttons/Comp1/C1T1A3Button/Label.text = Global.Comp1.T1A3_name
		$Buttons/Comp1/C1T1A3Button.visible = true
		if Global.Comp1.SP < Global.Comp1.T1A3_cost:
			$Buttons/Comp1/C1T1A3Button.disabled = true
		else:
			$Buttons/Comp1/C1T1A3Button.disabled = false
	
	if Global.Comp1.T2_unlock:
		$Buttons/Comp1/C1T2Button.visible = true
	if Global.Comp1.T3_unlock:
		$Buttons/Comp1/C1T3Button.visible = true
	if Global.Comp1.T4_unlock:
		$Buttons/Comp1/C1T4Button.visible = true
	
	$Buttons/Comp1/C1SwapButton.visible = true
	$Buttons/Comp1/C1WaitButton.visible = true
	if Global.Comp1.SP < Global.Comp1.T1A1_cost:
		$Buttons/Comp1/C1T1A1Button.disabled = true
	else:
		$Buttons/Comp1/C1T1A1Button.disabled = false
	
	$Buttons/Comp1.visible = true

func _on_c1_t1_button_pressed():
	$Buttons/Comp1/C1T2A1Button.visible = false
	$Buttons/Comp1/C1T2A2Button.visible = false
	$Buttons/Comp1/C1T2A3Button.visible = false
	$Buttons/Comp1/C1T3A1Button.visible = false
	$Buttons/Comp1/C1T3A2Button.visible = false
	$Buttons/Comp1/C1T3A3Button.visible = false
	$Buttons/Comp1/C1T4A1Button.visible = false
	$Buttons/Comp1/C1T4A2Button.visible = false
	$Buttons/Comp1/C1T4A3Button.visible = false
	$Buttons/Comp1/C1T1A1Button.visible = true
	if Global.Comp1.SP < Global.Comp1.T1A1_cost:
		$Buttons/Comp1/C1T1A1Button.disabled = true
	else:
		$Buttons/Comp1/C1T1A1Button.disabled = false
	if Global.Comp1.T1A2_unlock:
		$Buttons/Comp1/C1T1A2Button/Label.text = Global.Comp1.T1A2_name
		$Buttons/Comp1/C1T1A2Button.visible = true
		if Global.Comp1.SP < Global.Comp1.T1A2_cost:
			$Buttons/Comp1/C1T1A2Button.disabled = true
		else:
			$Buttons/Comp1/C1T1A2Button.disabled = false
	if Global.Comp1.T1A3_unlock:
		$Buttons/Comp1/C1T1A3Button/Label.text = Global.Comp1.T1A3_name
		$Buttons/Comp1/C1T1A3Button.visible = true
		if Global.Comp1.SP < Global.Comp1.T1A3_cost:
			$Buttons/Comp1/C1T1A3Button.disabled = true
		else:
			$Buttons/Comp1/C1T1A3Button.disabled = false

func _on_c1_t2_button_pressed():
	$Buttons/Comp1/C1T1A1Button.visible = false
	$Buttons/Comp1/C1T1A2Button.visible = false
	$Buttons/Comp1/C1T1A3Button.visible = false
	$Buttons/Comp1/C1T3A1Button.visible = false
	$Buttons/Comp1/C1T3A2Button.visible = false
	$Buttons/Comp1/C1T3A3Button.visible = false
	$Buttons/Comp1/C1T4A1Button.visible = false
	$Buttons/Comp1/C1T4A2Button.visible = false
	$Buttons/Comp1/C1T4A3Button.visible = false
	$Buttons/Comp1/C1T2A1Button.visible = true
	$Buttons/Comp1/C1T2A1Button/Label.text = Global.Comp1.T2A1_Name
	if Global.Comp1.SP < Global.Comp1.T2A1_cost:
		$Buttons/Comp1/C1T2A1Button.disabled = true
	else:
		$Buttons/Comp1/C1T2A1Button.disabled = false
	if Global.Comp1.T2A2_unlock:
		$Buttons/Comp1/C1T2A2Button/Label.text = Global.Comp1.T2A2_name
		$Buttons/Comp1/C1T2A2Button.visible = true
		if Global.Comp1.SP < Global.Comp1.T2A2_cost:
			$Buttons/Comp1/C1T2A2Button.disabled = true
		else:
			$Buttons/Comp1/C1T2A2Button.disabled = false
	if Global.Comp1.T2A3_unlock:
		$Buttons/Comp1/C1T2A3Button/Label.text = Global.Comp1.T2A3_name
		$Buttons/Comp1/C1T2A3Button.visible = true
		if Global.Comp1.SP < Global.Comp1.T2A3_cost:
			$Buttons/Comp1/C1T2A3Button.disabled = true
		else:
			$Buttons/Comp1/C1T2A3Button.disabled = false

func _on_c1_t3_button_pressed():
	$Buttons/Comp1/C1T1A1Button.visible = false
	$Buttons/Comp1/C1T1A2Button.visible = false
	$Buttons/Comp1/C1T1A3Button.visible = false
	$Buttons/Comp1/C1T2A1Button.visible = false
	$Buttons/Comp1/C1T2A2Button.visible = false
	$Buttons/Comp1/C1T2A3Button.visible = false
	$Buttons/Comp1/C1T4A1Button.visible = false
	$Buttons/Comp1/C1T4A2Button.visible = false
	$Buttons/Comp1/C1T4A3Button.visible = false
	$Buttons/Comp1/C1T3A1Button.visible = true
	$Buttons/Comp1/C1T3A1Button/Label.text = Global.Comp1.T3A1_Name
	if Global.Comp1.SP < Global.Comp1.T3A1_cost:
		$Buttons/Comp1/C1T3A1Button.disabled = true
	else:
		$Buttons/Comp1/C1T3A1Button.disabled = false
	if Global.Comp1.T3A2_unlock:
		$Buttons/Comp1/C1T3A2Button/Label.text = Global.Comp1.T3A2_name
		$Buttons/Comp1/C1T3A2Button.visible = true
		if Global.Comp1.SP < Global.Comp1.T3A2_cost:
			$Buttons/Comp1/C1T3A2Button.disabled = true
		else:
			$Buttons/Comp1/C1T3A2Button.disabled = false
	if Global.Comp1.T3A3_unlock:
		$Buttons/Comp1/C1T3A3Button/Label.text = Global.Comp1.T3A3_name
		$Buttons/Comp1/C1T3A3Button.visible = true
		if Global.Comp1.SP < Global.Comp1.T3A3_cost:
			$Buttons/Comp1/C1T3A3Button.disabled = true
		else:
			$Buttons/Comp1/C1T3A3Button.disabled = false

func _on_c1_t4_button_pressed():
	$Buttons/Comp1/C1T1A1Button.visible = false
	$Buttons/Comp1/C1T1A2Button.visible = false
	$Buttons/Comp1/C1T1A3Button.visible = false
	$Buttons/Comp1/C1T2A1Button.visible = false
	$Buttons/Comp1/C1T2A2Button.visible = false
	$Buttons/Comp1/C1T2A3Button.visible = false
	$Buttons/Comp1/C1T3A1Button.visible = false
	$Buttons/Comp1/C1T3A2Button.visible = false
	$Buttons/Comp1/C1T3A3Button.visible = false
	$Buttons/Comp1/C1T4A1Button.visible = true
	$Buttons/Comp1/C1T4A1Button/Label.text = Global.Comp1.T4A1_Name
	if Global.Comp1.SP < Global.Comp1.T4A1_cost:
		$Buttons/Comp1/C1T4A1Button.disabled = true
	else:
		$Buttons/Comp1/C1T4A1Button.disabled = false
	if Global.Comp1.T4A2_unlock:
		$Buttons/Comp1/C1T4A2Button/Label.text = Global.Comp1.T4A2_name
		$Buttons/Comp1/C1T4A2Button.visible = true
		if Global.Comp1.SP < Global.Comp1.T4A2_cost:
			$Buttons/Comp1/C1T4A2Button.disabled = true
		else:
			$Buttons/Comp1/C1T4A2Button.disabled = false
	if Global.Comp1.T4A3_unlock:
		$Buttons/Comp1/C1T4A3Button/Label.text = Global.Comp1.T4A3_name
		$Buttons/Comp1/C1T4A3Button.visible = true
		if Global.Comp1.SP < Global.Comp1.T4A3_cost:
			$Buttons/Comp1/C1T4A3Button.disabled = true
		else:
			$Buttons/Comp1/C1T4A3Button.disabled = false

func _on_c1_t1_a1_button_pressed():
	if Global.Comp1.T1A1_is_attack:
		total_attack += Global.Comp1.t1_a1(total_attack)
	else:
		total_defense += Global.Comp1.t1_a1(total_defense)
	Global.Comp1.SP -= Global.Comp1.T1A1_cost
	$Buttons/Comp1.visible = false
	await log_process_text(Global.Comp1.T1A1_log)

func _on_c1_t1_a2_button_pressed():
	if Global.Comp1.T1A2_is_attack:
		total_attack += Global.Comp1.t1_a2(total_attack)
	else:
		total_defense += Global.Comp1.t1_a2(total_defense)
	Global.Comp1.SP -= Global.Comp1.T1A2_cost
	$Buttons/Comp1.visible = false
	await log_process_text(Global.Comp1.T1A2_log)

func _on_c1_t1_a3_button_pressed():
	if Global.Comp1.T1A3_is_attack:
		total_attack += Global.Comp1.t1_a3(total_attack)
	else:
		total_defense += Global.Comp1.t1_a3(total_defense)
	Global.Comp1.SP -= Global.Comp1.T1A3_cost
	$Buttons/Comp1.visible = false
	await log_process_text(Global.Comp1.T1A3_log)

func _on_c1_t2_a1_button_pressed():
	if Global.Comp1.T2A1_is_attack:
		total_attack += Global.Comp1.t2_a1(total_attack)
	else:
		total_defense += Global.Comp1.t2_a1(total_defense)
	Global.Comp1.SP -= Global.Comp1.T2A1_cost
	$Buttons/Comp1.visible = false
	await log_process_text(Global.Comp1.T2A1_log)

func _on_c1_t2_a2_button_pressed():
	if Global.Comp1.T2A2_is_attack:
		total_attack += Global.Comp1.t2_a2(total_attack)
	else:
		total_defense += Global.Comp1.t2_a2(total_defense)
	Global.Comp1.SP -= Global.Comp1.T2A2_cost
	$Buttons/Comp1.visible = false
	await log_process_text(Global.Comp1.T2A2_log)

func _on_c1_t2_a3_button_pressed():
	if Global.Comp1.T2A3_is_attack:
		total_attack += Global.Comp1.t2_a3(total_attack)
	else:
		total_defense += Global.Comp1.t2_a3(total_defense)
	Global.Comp1.SP -= Global.Comp1.T2A3_cost
	$Buttons/Comp1.visible = false
	await log_process_text(Global.Comp1.T2A3_log)

func _on_c1_t3_a1_button_pressed():
	if Global.Comp1.T3A1_is_attack:
		total_attack += Global.Comp1.t3_a1(total_attack)
	else:
		total_defense += Global.Comp1.t3_a1(total_defense)
	Global.Comp1.SP -= Global.Comp1.T3A1_cost
	$Buttons/Comp1.visible = false
	await log_process_text(Global.Comp1.T3A1_log)

func _on_c1_t3_a2_button_pressed():
	if Global.Comp1.T3A2_is_attack:
		total_attack += Global.Comp1.t3_a2(total_attack)
	else:
		total_defense += Global.Comp1.t3_a2(total_defense)
	Global.Comp1.SP -= Global.Comp1.T3A2_cost
	$Buttons/Comp1.visible = false
	await log_process_text(Global.Comp1.T3A2_log)

func _on_c1_t3_a3_button_pressed():
	if Global.Comp1.T3A3_is_attack:
		total_attack += Global.Comp1.t3_a3(total_attack)
	else:
		total_defense += Global.Comp1.t3_a3(total_defense)
	Global.Comp1.SP -= Global.Comp1.T3A3_cost
	$Buttons/Comp1.visible = false
	await log_process_text(Global.Comp1.T3A3_log)

func _on_c1_t4_a1_button_pressed():
	if Global.Comp1.T4A1_is_attack:
		total_attack += Global.Comp1.t4_a1(total_attack)
	else:
		total_defense += Global.Comp1.t4_a1(total_defense)
	Global.Comp1.SP -= Global.Comp1.T4A1_cost
	$Buttons/Comp1.visible = false
	await log_process_text(Global.Comp1.T4A1_log)

func _on_c1_t4_a2_button_pressed():
	if Global.Comp1.T4A2_is_attack:
		total_attack += Global.Comp1.t4_a2(total_attack)
	else:
		total_defense += Global.Comp1.t4_a2(total_defense)
	Global.Comp1.SP -= Global.Comp1.T4A2_cost
	$Buttons/Comp1.visible = false
	await log_process_text(Global.Comp1.T4A2_log)

func _on_c_1t_4a_3_button_pressed():
	if Global.Comp1.T4A3_is_attack:
		total_attack += Global.Comp1.t4_a3(total_attack)
	else:
		total_defense += Global.Comp1.t4_a3(total_defense)
	Global.Comp1.SP -= Global.Comp1.T4A3_cost
	$Buttons/Comp1.visible = false
	await log_process_text(Global.Comp1.T4A3_log)

func _on_c1_wait_button_pressed():
	Global.Comp1.SP += int(0.1 * Global.Comp1.SPMax)
	if Global.Comp1.SP > Global.Comp1.SPMax:
		Global.Comp1.SP = Global.Comp1.SPMax
	$Buttons/Comp1.visible = false
	await log_process_text(Global.Comp1.Name + " waits")

func _on_c1_swap_button_pressed():
	$Buttons/Comp1/C1T1Button.visible = false
	$Buttons/Comp1/C1T1A1Button.visible = false
	$Buttons/Comp1/C1T1A2Button.visible = false
	$Buttons/Comp1/C1T1A3Button.visible = false
	$Buttons/Comp1/C1T2Button.visible = false
	$Buttons/Comp1/C1T2A1Button.visible = false
	$Buttons/Comp1/C1T2A2Button.visible = false
	$Buttons/Comp1/C1T2A3Button.visible = false
	$Buttons/Comp1/C1T3Button.visible = false
	$Buttons/Comp1/C1T3A1Button.visible = false
	$Buttons/Comp1/C1T3A2Button.visible = false
	$Buttons/Comp1/C1T3A3Button.visible = false
	$Buttons/Comp1/C1T4Button.visible = false
	$Buttons/Comp1/C1T4A1Button.visible = false
	$Buttons/Comp1/C1T4A2Button.visible = false
	$Buttons/Comp1/C1T4A3Button.visible = false
	$Buttons/Comp1/C1SwapButton.visible = false
	$Buttons/Comp1/C1WaitButton.visible = false
	$Buttons/Comp1/SwapButtons.visible = true

func _on_c1_s2_button_pressed():
	var temp = Global.Comp1
	Global.Comp1 = Global.Comp2
	Global.Comp2 = temp
	$TeamOrder/Slot1.texture = ResourceLoader.load(Global.Comp1.IconBattleFP)
	$TeamOrder/Slot2.texture = ResourceLoader.load(Global.Comp2.IconBattleFP)
	$Player/Comp1.texture = ResourceLoader.load(Global.Comp1.SpriteBattleFP)
	$Player/Comp2.texture = ResourceLoader.load(Global.Comp2.SpriteBattleFP)
	$Buttons/Comp1.visible = false
	$Buttons/Comp1/SwapButtons.visible = false
	await log_process_text(Global.Comp2.Name + " has swapped with " + Global.Comp1.Name)

func _on_c1_s3_button_pressed():
	var temp = Global.Comp1
	Global.Comp1 = Global.Comp3
	Global.Comp3 = temp
	$TeamOrder/Slot1.texture = ResourceLoader.load(Global.Comp1.IconBattleFP)
	$TeamOrder/Slot3.texture = ResourceLoader.load(Global.Comp3.IconBattleFP)
	$Player/Comp1.texture = ResourceLoader.load(Global.Comp1.SpriteBattleFP)
	$Player/Comp3.texture = ResourceLoader.load(Global.Comp3.SpriteBattleFP)
	$Buttons/Comp1.visible = false
	$Buttons/Comp1/SwapButtons.visible = false
	await log_process_text(Global.Comp3.Name + " has swapped with " + Global.Comp1.Name)

func _on_c1_s4_button_pressed():
	var temp = Global.Comp1
	Global.Comp1 = Global.Comp4
	Global.Comp4 = temp
	$TeamOrder/Slot1.texture = ResourceLoader.load(Global.Comp1.IconBattleFP)
	$TeamOrder/Slot4.texture = ResourceLoader.load(Global.Comp4.IconBattleFP)
	$Player/Comp1.texture = ResourceLoader.load(Global.Comp1.SpriteBattleFP)
	$Player/Comp4.texture = ResourceLoader.load(Global.Comp4.SpriteBattleFP)
	$Buttons/Comp1.visible = false
	$Buttons/Comp1/SwapButtons.visible = false
	await log_process_text(Global.Comp4.Name + " has swapped with " + Global.Comp1.Name)

#endregion
#endregion


#region CORE Functions
func battle_start():
	await log_process_text(Global.Enemy.Name + " has appeared!!")
	await log_process_text(Global.Enemy.Name + " has appeared!! But test!")
	PT_Comp1()

#endregion








































