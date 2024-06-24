extends CanvasLayer

var log_array = []

var enemy_current_health

var total_attack
var total_defense
var total_attack_e
var total_defense_e

#region Initialise all text and variables
func _ready():
	# Enemy
	total_attack_e = 0
	total_defense_e = Global.Enemy.Defense
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

func _on_button_2_pressed():
	await log_process_text(str(total_attack))

func _on_button_3_pressed():
	await log_process_text(str(total_defense))

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
func ET_start():
	await log_process_text(Global.Enemy.Name + " is thinking")
	total_attack_e = 0
	total_defense_e = Global.Enemy.Defense
	await get_tree().create_timer(2.0).timeout
	if enemy_current_health <= ($HealthBars/EnemyHealth.max_value / 2):
		total_defense_e = Global.Enemy.defend(total_defense_e)
		await log_process_text(Global.Enemy.Name + " defends")
		PT_Comp1()
	else:
		total_attack_e = Global.Enemy.attack(total_attack_e)
		await log_process_text(Global.Enemy.Name + " attacks")
		await damage_extor(total_attack_e)
		PT_Comp1()
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
	$Buttons/Comp1/C1T2A1Button/Label.text = Global.Comp1.T2A1_name
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
	$Buttons/Comp1/C1T3A1Button/Label.text = Global.Comp1.T3A1_name
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
	$Buttons/Comp1/C1T4A1Button/Label.text = Global.Comp1.T4A1_name
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
		total_attack = Global.Comp1.t1_a1(total_attack)
	else:
		total_defense = Global.Comp1.t1_a1(total_defense)
	Global.Comp1.SP -= Global.Comp1.T1A1_cost
	$Buttons/Comp1.visible = false
	await log_process_text(Global.Comp1.T1A1_log)
	PT_Comp2()

func _on_c1_t1_a2_button_pressed():
	if Global.Comp1.T1A2_is_attack:
		total_attack = Global.Comp1.t1_a2(total_attack)
	else:
		total_defense = Global.Comp1.t1_a2(total_defense)
	Global.Comp1.SP -= Global.Comp1.T1A2_cost
	$Buttons/Comp1.visible = false
	await log_process_text(Global.Comp1.T1A2_log)
	PT_Comp2()

func _on_c1_t1_a3_button_pressed():
	if Global.Comp1.T1A3_is_attack:
		total_attack = Global.Comp1.t1_a3(total_attack)
	else:
		total_defense = Global.Comp1.t1_a3(total_defense)
	Global.Comp1.SP -= Global.Comp1.T1A3_cost
	$Buttons/Comp1.visible = false
	await log_process_text(Global.Comp1.T1A3_log)
	PT_Comp2()

func _on_c1_t2_a1_button_pressed():
	if Global.Comp1.T2A1_is_attack:
		total_attack = Global.Comp1.t2_a1(total_attack)
	else:
		total_defense = Global.Comp1.t2_a1(total_defense)
	Global.Comp1.SP -= Global.Comp1.T2A1_cost
	$Buttons/Comp1.visible = false
	await log_process_text(Global.Comp1.T2A1_log)
	PT_Comp2()

func _on_c1_t2_a2_button_pressed():
	if Global.Comp1.T2A2_is_attack:
		total_attack = Global.Comp1.t2_a2(total_attack)
	else:
		total_defense = Global.Comp1.t2_a2(total_defense)
	Global.Comp1.SP -= Global.Comp1.T2A2_cost
	$Buttons/Comp1.visible = false
	await log_process_text(Global.Comp1.T2A2_log)
	PT_Comp2()

func _on_c1_t2_a3_button_pressed():
	if Global.Comp1.T2A3_is_attack:
		total_attack = Global.Comp1.t2_a3(total_attack)
	else:
		total_defense = Global.Comp1.t2_a3(total_defense)
	Global.Comp1.SP -= Global.Comp1.T2A3_cost
	$Buttons/Comp1.visible = false
	await log_process_text(Global.Comp1.T2A3_log)
	PT_Comp2()

func _on_c1_t3_a1_button_pressed():
	if Global.Comp1.T3A1_is_attack:
		total_attack = Global.Comp1.t3_a1(total_attack)
	else:
		total_defense = Global.Comp1.t3_a1(total_defense)
	Global.Comp1.SP -= Global.Comp1.T3A1_cost
	$Buttons/Comp1.visible = false
	await log_process_text(Global.Comp1.T3A1_log)
	PT_Comp2()

func _on_c1_t3_a2_button_pressed():
	if Global.Comp1.T3A2_is_attack:
		total_attack = Global.Comp1.t3_a2(total_attack)
	else:
		total_defense = Global.Comp1.t3_a2(total_defense)
	Global.Comp1.SP -= Global.Comp1.T3A2_cost
	$Buttons/Comp1.visible = false
	await log_process_text(Global.Comp1.T3A2_log)
	PT_Comp2()

func _on_c1_t3_a3_button_pressed():
	if Global.Comp1.T3A3_is_attack:
		total_attack = Global.Comp1.t3_a3(total_attack)
	else:
		total_defense = Global.Comp1.t3_a3(total_defense)
	Global.Comp1.SP -= Global.Comp1.T3A3_cost
	$Buttons/Comp1.visible = false
	await log_process_text(Global.Comp1.T3A3_log)
	PT_Comp2()

func _on_c1_t4_a1_button_pressed():
	if Global.Comp1.T4A1_is_attack:
		total_attack = Global.Comp1.t4_a1(total_attack)
	else:
		total_defense = Global.Comp1.t4_a1(total_defense)
	Global.Comp1.SP -= Global.Comp1.T4A1_cost
	$Buttons/Comp1.visible = false
	await log_process_text(Global.Comp1.T4A1_log)
	PT_Comp2()

func _on_c1_t4_a2_button_pressed():
	if Global.Comp1.T4A2_is_attack:
		total_attack = Global.Comp1.t4_a2(total_attack)
	else:
		total_defense = Global.Comp1.t4_a2(total_defense)
	Global.Comp1.SP -= Global.Comp1.T4A2_cost
	$Buttons/Comp1.visible = false
	await log_process_text(Global.Comp1.T4A2_log)
	PT_Comp2()

func _on_c1_t4_a3_button_pressed():
	if Global.Comp1.T4A3_is_attack:
		total_attack = Global.Comp1.t4_a3(total_attack)
	else:
		total_defense = Global.Comp1.t4_a3(total_defense)
	Global.Comp1.SP -= Global.Comp1.T4A3_cost
	$Buttons/Comp1.visible = false
	await log_process_text(Global.Comp1.T4A3_log)
	PT_Comp2()

func _on_c1_wait_button_pressed():
	Global.Comp1.SP += int(0.1 * Global.Comp1.SPMax)
	if Global.Comp1.SP > Global.Comp1.SPMax:
		Global.Comp1.SP = Global.Comp1.SPMax
	$Buttons/Comp1.visible = false
	await log_process_text(Global.Comp1.Name + " waits")
	PT_Comp2()

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
	PT_Comp2()

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
	PT_Comp2()

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
	PT_Comp2()

#endregion

#region Companion 2
func PT_Comp2():
	$TeamOrder/Label.text = Global.Comp2.Name + " SP: " + str(Global.Comp2.SP)
	$Buttons/Comp2/C2T1A1Button/Label.text = Global.Comp2.T1A1_name
	$Buttons/Comp2/SwapButtons.visible = false
	$Buttons/Comp2/C2T1Button.visible = true
	$Buttons/Comp2/C2T1A1Button.visible = true
	if Global.Comp2.T1A2_unlock:
		$Buttons/Comp2/C2T1A2Button/Label.text = Global.Comp2.T1A2_name
		$Buttons/Comp2/C2T1A2Button.visible = true
		if Global.Comp2.SP < Global.Comp2.T1A2_cost:
			$Buttons/Comp2/C2T1A2Button.disabled = true
		else:
			$Buttons/Comp2/C2T1A2Button.disabled = false
	if Global.Comp2.T1A3_unlock:
		$Buttons/Comp2/C2T1A3Button/Label.text = Global.Comp2.T1A3_name
		$Buttons/Comp2/C2T1A3Button.visible = true
		if Global.Comp2.SP < Global.Comp2.T1A3_cost:
			$Buttons/Comp2/C2T1A3Button.disabled = true
		else:
			$Buttons/Comp2/C2T1A3Button.disabled = false
	
	if Global.Comp2.T2_unlock:
		$Buttons/Comp2/C2T2Button.visible = true
	if Global.Comp2.T3_unlock:
		$Buttons/Comp2/C2T3Button.visible = true
	if Global.Comp2.T4_unlock:
		$Buttons/Comp2/C2T4Button.visible = true
	
	$Buttons/Comp2/C2SwapButton.visible = true
	$Buttons/Comp2/C2WaitButton.visible = true
	if Global.Comp2.SP < Global.Comp2.T1A1_cost:
		$Buttons/Comp2/C2T1A1Button.disabled = true
	else:
		$Buttons/Comp2/C2T1A1Button.disabled = false
	
	$Buttons/Comp2.visible = true

func _on_c2_t1_button_pressed():
	$Buttons/Comp2/C2T2A1Button.visible = false
	$Buttons/Comp2/C2T2A2Button.visible = false
	$Buttons/Comp2/C2T2A3Button.visible = false
	$Buttons/Comp2/C2T3A1Button.visible = false
	$Buttons/Comp2/C2T3A2Button.visible = false
	$Buttons/Comp2/C2T3A3Button.visible = false
	$Buttons/Comp2/C2T4A1Button.visible = false
	$Buttons/Comp2/C2T4A2Button.visible = false
	$Buttons/Comp2/C2T4A3Button.visible = false
	$Buttons/Comp2/C2T1A1Button.visible = true
	if Global.Comp2.SP < Global.Comp2.T1A1_cost:
		$Buttons/Comp2/C2T1A1Button.disabled = true
	else:
		$Buttons/Comp2/C2T1A1Button.disabled = false
	if Global.Comp2.T1A2_unlock:
		$Buttons/Comp2/C2T1A2Button/Label.text = Global.Comp2.T1A2_name
		$Buttons/Comp2/C2T1A2Button.visible = true
		if Global.Comp2.SP < Global.Comp2.T1A2_cost:
			$Buttons/Comp2/C2T1A2Button.disabled = true
		else:
			$Buttons/Comp2/C2T1A2Button.disabled = false
	if Global.Comp2.T1A3_unlock:
		$Buttons/Comp2/C2T1A3Button/Label.text = Global.Comp2.T1A3_name
		$Buttons/Comp2/C2T1A3Button.visible = true
		if Global.Comp2.SP < Global.Comp2.T1A3_cost:
			$Buttons/Comp2/C2T1A3Button.disabled = true
		else:
			$Buttons/Comp2/C2T1A3Button.disabled = false

func _on_c2_t2_button_pressed():
	$Buttons/Comp2/C2T1A1Button.visible = false
	$Buttons/Comp2/C2T1A2Button.visible = false
	$Buttons/Comp2/C2T1A3Button.visible = false
	$Buttons/Comp2/C2T3A1Button.visible = false
	$Buttons/Comp2/C2T3A2Button.visible = false
	$Buttons/Comp2/C2T3A3Button.visible = false
	$Buttons/Comp2/C2T4A1Button.visible = false
	$Buttons/Comp2/C2T4A2Button.visible = false
	$Buttons/Comp2/C2T4A3Button.visible = false
	$Buttons/Comp2/C2T2A1Button.visible = true
	$Buttons/Comp2/C2T2A1Button/Label.text = Global.Comp2.T2A1_name
	if Global.Comp2.SP < Global.Comp2.T2A1_cost:
		$Buttons/Comp2/C2T2A1Button.disabled = true
	else:
		$Buttons/Comp2/C2T2A1Button.disabled = false
	if Global.Comp2.T2A2_unlock:
		$Buttons/Comp2/C2T2A2Button/Label.text = Global.Comp2.T2A2_name
		$Buttons/Comp2/C2T2A2Button.visible = true
		if Global.Comp2.SP < Global.Comp2.T2A2_cost:
			$Buttons/Comp2/C2T2A2Button.disabled = true
		else:
			$Buttons/Comp2/C2T2A2Button.disabled = false
	if Global.Comp2.T2A3_unlock:
		$Buttons/Comp2/C2T2A3Button/Label.text = Global.Comp2.T2A3_name
		$Buttons/Comp2/C2T2A3Button.visible = true
		if Global.Comp2.SP < Global.Comp2.T2A3_cost:
			$Buttons/Comp2/C2T2A3Button.disabled = true
		else:
			$Buttons/Comp2/C2T2A3Button.disabled = false

func _on_c2_t3_button_pressed():
	$Buttons/Comp2/C2T1A1Button.visible = false
	$Buttons/Comp2/C2T1A2Button.visible = false
	$Buttons/Comp2/C2T1A3Button.visible = false
	$Buttons/Comp2/C2T2A1Button.visible = false
	$Buttons/Comp2/C2T2A2Button.visible = false
	$Buttons/Comp2/C2T2A3Button.visible = false
	$Buttons/Comp2/C2T4A1Button.visible = false
	$Buttons/Comp2/C2T4A2Button.visible = false
	$Buttons/Comp2/C2T4A3Button.visible = false
	$Buttons/Comp2/C2T3A1Button.visible = true
	$Buttons/Comp2/C2T3A1Button/Label.text = Global.Comp2.T3A1_name
	if Global.Comp2.SP < Global.Comp2.T3A1_cost:
		$Buttons/Comp2/C2T3A1Button.disabled = true
	else:
		$Buttons/Comp2/C2T3A1Button.disabled = false
	if Global.Comp2.T3A2_unlock:
		$Buttons/Comp2/C2T3A2Button/Label.text = Global.Comp2.T3A2_name
		$Buttons/Comp2/C2T3A2Button.visible = true
		if Global.Comp2.SP < Global.Comp2.T3A2_cost:
			$Buttons/Comp2/C2T3A2Button.disabled = true
		else:
			$Buttons/Comp2/C2T3A2Button.disabled = false
	if Global.Comp2.T3A3_unlock:
		$Buttons/Comp2/C2T3A3Button/Label.text = Global.Comp2.T3A3_name
		$Buttons/Comp2/C2T3A3Button.visible = true
		if Global.Comp2.SP < Global.Comp2.T3A3_cost:
			$Buttons/Comp2/C2T3A3Button.disabled = true
		else:
			$Buttons/Comp2/C2T3A3Button.disabled = false

func _on_c2_t4_button_pressed():
	$Buttons/Comp2/C2T1A1Button.visible = false
	$Buttons/Comp2/C2T1A2Button.visible = false
	$Buttons/Comp2/C2T1A3Button.visible = false
	$Buttons/Comp2/C2T2A1Button.visible = false
	$Buttons/Comp2/C2T2A2Button.visible = false
	$Buttons/Comp2/C2T2A3Button.visible = false
	$Buttons/Comp2/C2T3A1Button.visible = false
	$Buttons/Comp2/C2T3A2Button.visible = false
	$Buttons/Comp2/C2T3A3Button.visible = false
	$Buttons/Comp2/C2T4A1Button.visible = true
	$Buttons/Comp2/C2T4A1Button/Label.text = Global.Comp2.T4A1_name
	if Global.Comp2.SP < Global.Comp2.T4A1_cost:
		$Buttons/Comp2/C2T4A1Button.disabled = true
	else:
		$Buttons/Comp2/C2T4A1Button.disabled = false
	if Global.Comp2.T4A2_unlock:
		$Buttons/Comp2/C2T4A2Button/Label.text = Global.Comp2.T4A2_name
		$Buttons/Comp2/C2T4A2Button.visible = true
		if Global.Comp2.SP < Global.Comp2.T4A2_cost:
			$Buttons/Comp2/C2T4A2Button.disabled = true
		else:
			$Buttons/Comp2/C2T4A2Button.disabled = false
	if Global.Comp2.T4A3_unlock:
		$Buttons/Comp2/C2T4A3Button/Label.text = Global.Comp2.T4A3_name
		$Buttons/Comp2/C2T4A3Button.visible = true
		if Global.Comp2.SP < Global.Comp2.T4A3_cost:
			$Buttons/Comp2/C2T4A3Button.disabled = true
		else:
			$Buttons/Comp2/C2T4A3Button.disabled = false

func _on_c2_t1_a1_button_pressed():
	if Global.Comp2.T1A1_is_attack:
		total_attack = Global.Comp2.t1_a1(total_attack)
	else:
		total_defense = Global.Comp2.t1_a1(total_defense)
	Global.Comp2.SP -= Global.Comp2.T1A1_cost
	$Buttons/Comp2.visible = false
	await log_process_text(Global.Comp2.T1A1_log)
	PT_Comp3()

func _on_c2_t1_a2_button_pressed():
	if Global.Comp2.T1A2_is_attack:
		total_attack = Global.Comp2.t1_a2(total_attack)
	else:
		total_defense = Global.Comp2.t1_a2(total_defense)
	Global.Comp2.SP -= Global.Comp2.T1A2_cost
	$Buttons/Comp2.visible = false
	await log_process_text(Global.Comp2.T1A2_log)
	PT_Comp3()

func _on_c2_t1_a3_button_pressed():
	if Global.Comp2.T1A3_is_attack:
		total_attack = Global.Comp2.t1_a3(total_attack)
	else:
		total_defense = Global.Comp2.t1_a3(total_defense)
	Global.Comp2.SP -= Global.Comp2.T1A3_cost
	$Buttons/Comp2.visible = false
	await log_process_text(Global.Comp2.T1A3_log)
	PT_Comp3()

func _on_c2_t2_a1_button_pressed():
	if Global.Comp2.T2A1_is_attack:
		total_attack = Global.Comp2.t2_a1(total_attack)
	else:
		total_defense = Global.Comp2.t2_a1(total_defense)
	Global.Comp2.SP -= Global.Comp2.T2A1_cost
	$Buttons/Comp2.visible = false
	await log_process_text(Global.Comp2.T2A1_log)
	PT_Comp3()

func _on_c2_t2_a2_button_pressed():
	if Global.Comp2.T2A2_is_attack:
		total_attack = Global.Comp2.t2_a2(total_attack)
	else:
		total_defense = Global.Comp2.t2_a2(total_defense)
	Global.Comp2.SP -= Global.Comp2.T2A2_cost
	$Buttons/Comp2.visible = false
	await log_process_text(Global.Comp2.T2A2_log)
	PT_Comp3()

func _on_c2_t2_a3_button_pressed():
	if Global.Comp2.T2A3_is_attack:
		total_attack = Global.Comp2.t2_a3(total_attack)
	else:
		total_defense = Global.Comp2.t2_a3(total_defense)
	Global.Comp2.SP -= Global.Comp2.T2A3_cost
	$Buttons/Comp2.visible = false
	await log_process_text(Global.Comp2.T2A3_log)
	PT_Comp3()

func _on_c2_t3_a1_button_pressed():
	if Global.Comp2.T3A1_is_attack:
		total_attack = Global.Comp2.t3_a1(total_attack)
	else:
		total_defense = Global.Comp2.t3_a1(total_defense)
	Global.Comp2.SP -= Global.Comp2.T3A1_cost
	$Buttons/Comp2.visible = false
	await log_process_text(Global.Comp2.T3A1_log)
	PT_Comp3()

func _on_c2_t3_a2_button_pressed():
	if Global.Comp2.T3A2_is_attack:
		total_attack = Global.Comp2.t3_a2(total_attack)
	else:
		total_defense = Global.Comp2.t3_a2(total_defense)
	Global.Comp2.SP -= Global.Comp2.T3A2_cost
	$Buttons/Comp2.visible = false
	await log_process_text(Global.Comp2.T3A2_log)
	PT_Comp3()

func _on_c2_t3_a3_button_pressed():
	if Global.Comp2.T3A3_is_attack:
		total_attack = Global.Comp2.t3_a3(total_attack)
	else:
		total_defense = Global.Comp2.t3_a3(total_defense)
	Global.Comp2.SP -= Global.Comp2.T3A3_cost
	$Buttons/Comp2.visible = false
	await log_process_text(Global.Comp2.T3A3_log)
	PT_Comp3()

func _on_c2_t4_a1_button_pressed():
	if Global.Comp2.T4A1_is_attack:
		total_attack = Global.Comp2.t4_a1(total_attack)
	else:
		total_defense = Global.Comp2.t4_a1(total_defense)
	Global.Comp2.SP -= Global.Comp2.T4A1_cost
	$Buttons/Comp2.visible = false
	await log_process_text(Global.Comp2.T4A1_log)
	PT_Comp3()

func _on_c2_t4_a2_button_pressed():
	if Global.Comp2.T4A2_is_attack:
		total_attack = Global.Comp2.t4_a2(total_attack)
	else:
		total_defense = Global.Comp2.t4_a2(total_defense)
	Global.Comp2.SP -= Global.Comp2.T4A2_cost
	$Buttons/Comp2.visible = false
	await log_process_text(Global.Comp2.T4A2_log)
	PT_Comp3()

func _on_c2_t4_a3_button_pressed():
	if Global.Comp2.T4A3_is_attack:
		total_attack = Global.Comp2.t4_a3(total_attack)
	else:
		total_defense = Global.Comp2.t4_a3(total_defense)
	Global.Comp2.SP -= Global.Comp2.T4A3_cost
	$Buttons/Comp2.visible = false
	await log_process_text(Global.Comp2.T4A3_log)
	PT_Comp3()

func _on_c2_wait_button_pressed():
	Global.Comp2.SP += int(0.1 * Global.Comp2.SPMax)
	if Global.Comp2.SP > Global.Comp2.SPMax:
		Global.Comp2.SP = Global.Comp2.SPMax
	$Buttons/Comp2.visible = false
	await log_process_text(Global.Comp2.Name + " waits")
	PT_Comp3()

func _on_c2_swap_button_pressed():
	$Buttons/Comp2/C2T1Button.visible = false
	$Buttons/Comp2/C2T1A1Button.visible = false
	$Buttons/Comp2/C2T1A2Button.visible = false
	$Buttons/Comp2/C2T1A3Button.visible = false
	$Buttons/Comp2/C2T2Button.visible = false
	$Buttons/Comp2/C2T2A1Button.visible = false
	$Buttons/Comp2/C2T2A2Button.visible = false
	$Buttons/Comp2/C2T2A3Button.visible = false
	$Buttons/Comp2/C2T3Button.visible = false
	$Buttons/Comp2/C2T3A1Button.visible = false
	$Buttons/Comp2/C2T3A2Button.visible = false
	$Buttons/Comp2/C2T3A3Button.visible = false
	$Buttons/Comp2/C2T4Button.visible = false
	$Buttons/Comp2/C2T4A1Button.visible = false
	$Buttons/Comp2/C2T4A2Button.visible = false
	$Buttons/Comp2/C2T4A3Button.visible = false
	$Buttons/Comp2/C2SwapButton.visible = false
	$Buttons/Comp2/C2WaitButton.visible = false
	$Buttons/Comp2/SwapButtons.visible = true

func _on_c2_s1_button_pressed():
	var temp = Global.Comp2
	Global.Comp2 = Global.Comp1
	Global.Comp1 = temp
	$TeamOrder/Slot1.texture = ResourceLoader.load(Global.Comp1.IconBattleFP)
	$TeamOrder/Slot2.texture = ResourceLoader.load(Global.Comp2.IconBattleFP)
	$Player/Comp1.texture = ResourceLoader.load(Global.Comp1.SpriteBattleFP)
	$Player/Comp2.texture = ResourceLoader.load(Global.Comp2.SpriteBattleFP)
	$Buttons/Comp2.visible = false
	$Buttons/Comp2/SwapButtons.visible = false
	await log_process_text(Global.Comp1.Name + " has swapped with " + Global.Comp2.Name)
	PT_Comp3()

func _on_c2_s3_button_pressed():
	var temp = Global.Comp2
	Global.Comp2 = Global.Comp3
	Global.Comp3 = temp
	$TeamOrder/Slot2.texture = ResourceLoader.load(Global.Comp2.IconBattleFP)
	$TeamOrder/Slot3.texture = ResourceLoader.load(Global.Comp3.IconBattleFP)
	$Player/Comp2.texture = ResourceLoader.load(Global.Comp2.SpriteBattleFP)
	$Player/Comp3.texture = ResourceLoader.load(Global.Comp3.SpriteBattleFP)
	$Buttons/Comp2.visible = false
	$Buttons/Comp2/SwapButtons.visible = false
	await log_process_text(Global.Comp3.Name + " has swapped with " + Global.Comp2.Name)
	PT_Comp3()

func _on_c2_s4_button_pressed():
	var temp = Global.Comp2
	Global.Comp2 = Global.Comp4
	Global.Comp4 = temp
	$TeamOrder/Slot2.texture = ResourceLoader.load(Global.Comp2.IconBattleFP)
	$TeamOrder/Slot4.texture = ResourceLoader.load(Global.Comp4.IconBattleFP)
	$Player/Comp2.texture = ResourceLoader.load(Global.Comp2.SpriteBattleFP)
	$Player/Comp4.texture = ResourceLoader.load(Global.Comp4.SpriteBattleFP)
	$Buttons/Comp2.visible = false
	$Buttons/Comp2/SwapButtons.visible = false
	await log_process_text(Global.Comp4.Name + " has swapped with " + Global.Comp2.Name)
	PT_Comp3()

#endregion

#region Companion 3
func PT_Comp3():
	$TeamOrder/Label.text = Global.Comp3.Name + " SP: " + str(Global.Comp3.SP)
	$Buttons/Comp3/C3T1A1Button/Label.text = Global.Comp3.T1A1_name
	$Buttons/Comp3/SwapButtons.visible = false
	$Buttons/Comp3/C3T1Button.visible = true
	$Buttons/Comp3/C3T1A1Button.visible = true
	if Global.Comp3.T1A2_unlock:
		$Buttons/Comp3/C3T1A2Button/Label.text = Global.Comp3.T1A2_name
		$Buttons/Comp3/C3T1A2Button.visible = true
		if Global.Comp3.SP < Global.Comp3.T1A2_cost:
			$Buttons/Comp3/C3T1A2Button.disabled = true
		else:
			$Buttons/Comp3/C3T1A2Button.disabled = false
	if Global.Comp3.T1A3_unlock:
		$Buttons/Comp3/C3T1A3Button/Label.text = Global.Comp3.T1A3_name
		$Buttons/Comp3/C3T1A3Button.visible = true
		if Global.Comp3.SP < Global.Comp3.T1A3_cost:
			$Buttons/Comp3/C3T1A3Button.disabled = true
		else:
			$Buttons/Comp3/C3T1A3Button.disabled = false
	
	if Global.Comp3.T2_unlock:
		$Buttons/Comp3/C3T2Button.visible = true
	if Global.Comp3.T3_unlock:
		$Buttons/Comp3/C3T3Button.visible = true
	if Global.Comp3.T4_unlock:
		$Buttons/Comp3/C3T4Button.visible = true
	
	$Buttons/Comp3/C3SwapButton.visible = true
	$Buttons/Comp3/C3WaitButton.visible = true
	if Global.Comp3.SP < Global.Comp3.T1A1_cost:
		$Buttons/Comp3/C3T1A1Button.disabled = true
	else:
		$Buttons/Comp3/C3T1A1Button.disabled = false
	
	$Buttons/Comp3.visible = true

func _on_c3_t1_button_pressed():
	$Buttons/Comp3/C3T2A1Button.visible = false
	$Buttons/Comp3/C3T2A2Button.visible = false
	$Buttons/Comp3/C3T2A3Button.visible = false
	$Buttons/Comp3/C3T3A1Button.visible = false
	$Buttons/Comp3/C3T3A2Button.visible = false
	$Buttons/Comp3/C3T3A3Button.visible = false
	$Buttons/Comp3/C3T4A1Button.visible = false
	$Buttons/Comp3/C3T4A2Button.visible = false
	$Buttons/Comp3/C3T4A3Button.visible = false
	$Buttons/Comp3/C3T1A1Button.visible = true
	if Global.Comp3.SP < Global.Comp3.T1A1_cost:
		$Buttons/Comp3/C3T1A1Button.disabled = true
	else:
		$Buttons/Comp3/C3T1A1Button.disabled = false
	if Global.Comp3.T1A2_unlock:
		$Buttons/Comp3/C3T1A2Button/Label.text = Global.Comp3.T1A2_name
		$Buttons/Comp3/C3T1A2Button.visible = true
		if Global.Comp3.SP < Global.Comp3.T1A2_cost:
			$Buttons/Comp3/C3T1A2Button.disabled = true
		else:
			$Buttons/Comp3/C3T1A2Button.disabled = false
	if Global.Comp3.T1A3_unlock:
		$Buttons/Comp3/C3T1A3Button/Label.text = Global.Comp3.T1A3_name
		$Buttons/Comp3/C3T1A3Button.visible = true
		if Global.Comp3.SP < Global.Comp3.T1A3_cost:
			$Buttons/Comp3/C3T1A3Button.disabled = true
		else:
			$Buttons/Comp3/C3T1A3Button.disabled = false

func _on_c3_t2_button_pressed():
	$Buttons/Comp3/C3T1A1Button.visible = false
	$Buttons/Comp3/C3T1A2Button.visible = false
	$Buttons/Comp3/C3T1A3Button.visible = false
	$Buttons/Comp3/C3T3A1Button.visible = false
	$Buttons/Comp3/C3T3A2Button.visible = false
	$Buttons/Comp3/C3T3A3Button.visible = false
	$Buttons/Comp3/C3T4A1Button.visible = false
	$Buttons/Comp3/C3T4A2Button.visible = false
	$Buttons/Comp3/C3T4A3Button.visible = false
	$Buttons/Comp3/C3T2A1Button.visible = true
	$Buttons/Comp3/C3T2A1Button/Label.text = Global.Comp3.T2A1_name
	if Global.Comp3.SP < Global.Comp3.T2A1_cost:
		$Buttons/Comp3/C3T2A1Button.disabled = true
	else:
		$Buttons/Comp3/C3T2A1Button.disabled = false
	if Global.Comp3.T2A2_unlock:
		$Buttons/Comp3/C3T2A2Button/Label.text = Global.Comp3.T2A2_name
		$Buttons/Comp3/C3T2A2Button.visible = true
		if Global.Comp3.SP < Global.Comp3.T2A2_cost:
			$Buttons/Comp3/C3T2A2Button.disabled = true
		else:
			$Buttons/Comp3/C3T2A2Button.disabled = false
	if Global.Comp3.T2A3_unlock:
		$Buttons/Comp3/C3T2A3Button/Label.text = Global.Comp3.T2A3_name
		$Buttons/Comp3/C3T2A3Button.visible = true
		if Global.Comp3.SP < Global.Comp3.T2A3_cost:
			$Buttons/Comp3/C3T2A3Button.disabled = true
		else:
			$Buttons/Comp3/C3T2A3Button.disabled = false

func _on_c3_t3_button_pressed():
	$Buttons/Comp3/C3T1A1Button.visible = false
	$Buttons/Comp3/C3T1A2Button.visible = false
	$Buttons/Comp3/C3T1A3Button.visible = false
	$Buttons/Comp3/C3T2A1Button.visible = false
	$Buttons/Comp3/C3T2A2Button.visible = false
	$Buttons/Comp3/C3T2A3Button.visible = false
	$Buttons/Comp3/C3T4A1Button.visible = false
	$Buttons/Comp3/C3T4A2Button.visible = false
	$Buttons/Comp3/C3T4A3Button.visible = false
	$Buttons/Comp3/C3T3A1Button.visible = true
	$Buttons/Comp3/C3T3A1Button/Label.text = Global.Comp3.T3A1_name
	if Global.Comp3.SP < Global.Comp3.T3A1_cost:
		$Buttons/Comp3/C3T3A1Button.disabled = true
	else:
		$Buttons/Comp3/C3T3A1Button.disabled = false
	if Global.Comp3.T3A2_unlock:
		$Buttons/Comp3/C3T3A2Button/Label.text = Global.Comp3.T3A2_name
		$Buttons/Comp3/C3T3A2Button.visible = true
		if Global.Comp3.SP < Global.Comp3.T3A2_cost:
			$Buttons/Comp3/C3T3A2Button.disabled = true
		else:
			$Buttons/Comp3/C3T3A2Button.disabled = false
	if Global.Comp3.T3A3_unlock:
		$Buttons/Comp3/C3T3A3Button/Label.text = Global.Comp3.T3A3_name
		$Buttons/Comp3/C3T3A3Button.visible = true
		if Global.Comp3.SP < Global.Comp3.T3A3_cost:
			$Buttons/Comp3/C3T3A3Button.disabled = true
		else:
			$Buttons/Comp3/C3T3A3Button.disabled = false

func _on_c3_t4_button_pressed():
	$Buttons/Comp3/C3T1A1Button.visible = false
	$Buttons/Comp3/C3T1A2Button.visible = false
	$Buttons/Comp3/C3T1A3Button.visible = false
	$Buttons/Comp3/C3T2A1Button.visible = false
	$Buttons/Comp3/C3T2A2Button.visible = false
	$Buttons/Comp3/C3T2A3Button.visible = false
	$Buttons/Comp3/C3T3A1Button.visible = false
	$Buttons/Comp3/C3T3A2Button.visible = false
	$Buttons/Comp3/C3T3A3Button.visible = false
	$Buttons/Comp3/C3T4A1Button.visible = true
	$Buttons/Comp3/C3T4A1Button/Label.text = Global.Comp3.T4A1_name
	if Global.Comp3.SP < Global.Comp3.T4A1_cost:
		$Buttons/Comp3/C3T4A1Button.disabled = true
	else:
		$Buttons/Comp3/C3T4A1Button.disabled = false
	if Global.Comp3.T4A2_unlock:
		$Buttons/Comp3/C3T4A2Button/Label.text = Global.Comp3.T4A2_name
		$Buttons/Comp3/C3T4A2Button.visible = true
		if Global.Comp3.SP < Global.Comp3.T4A2_cost:
			$Buttons/Comp3/C3T4A2Button.disabled = true
		else:
			$Buttons/Comp3/C3T4A2Button.disabled = false
	if Global.Comp3.T4A3_unlock:
		$Buttons/Comp3/C3T4A3Button/Label.text = Global.Comp3.T4A3_name
		$Buttons/Comp3/C3T4A3Button.visible = true
		if Global.Comp3.SP < Global.Comp3.T4A3_cost:
			$Buttons/Comp3/C3T4A3Button.disabled = true
		else:
			$Buttons/Comp3/C3T4A3Button.disabled = false

func _on_c3_t1_a1_button_pressed():
	if Global.Comp3.T1A1_is_attack:
		total_attack = Global.Comp3.t1_a1(total_attack)
	else:
		total_defense = Global.Comp3.t1_a1(total_defense)
	Global.Comp3.SP -= Global.Comp3.T1A1_cost
	$Buttons/Comp3.visible = false
	await log_process_text(Global.Comp3.T1A1_log)
	PT_Comp4()

func _on_c3_t1_a2_button_pressed():
	if Global.Comp3.T1A2_is_attack:
		total_attack = Global.Comp3.t1_a2(total_attack)
	else:
		total_defense = Global.Comp3.t1_a2(total_defense)
	Global.Comp3.SP -= Global.Comp3.T1A2_cost
	$Buttons/Comp3.visible = false
	await log_process_text(Global.Comp3.T1A2_log)
	PT_Comp4()

func _on_c3_t1_a3_button_pressed():
	if Global.Comp3.T1A3_is_attack:
		total_attack = Global.Comp3.t1_a3(total_attack)
	else:
		total_defense = Global.Comp3.t1_a3(total_defense)
	Global.Comp3.SP -= Global.Comp3.T1A3_cost
	$Buttons/Comp3.visible = false
	await log_process_text(Global.Comp3.T1A3_log)
	PT_Comp4()

func _on_c3_t2_a1_button_pressed():
	if Global.Comp3.T2A1_is_attack:
		total_attack = Global.Comp3.t2_a1(total_attack)
	else:
		total_defense = Global.Comp3.t2_a1(total_defense)
	Global.Comp3.SP -= Global.Comp3.T2A1_cost
	$Buttons/Comp3.visible = false
	await log_process_text(Global.Comp3.T2A1_log)
	PT_Comp4()

func _on_c3_t2_a2_button_pressed():
	if Global.Comp3.T2A2_is_attack:
		total_attack = Global.Comp3.t2_a2(total_attack)
	else:
		total_defense = Global.Comp3.t2_a2(total_defense)
	Global.Comp3.SP -= Global.Comp3.T2A2_cost
	$Buttons/Comp3.visible = false
	await log_process_text(Global.Comp3.T2A2_log)
	PT_Comp4()

func _on_c3_t2_a3_button_pressed():
	if Global.Comp3.T2A3_is_attack:
		total_attack = Global.Comp3.t2_a3(total_attack)
	else:
		total_defense = Global.Comp3.t2_a3(total_defense)
	Global.Comp3.SP -= Global.Comp3.T2A3_cost
	$Buttons/Comp3.visible = false
	await log_process_text(Global.Comp3.T2A3_log)
	PT_Comp4()

func _on_c3_t3_a1_button_pressed():
	if Global.Comp3.T3A1_is_attack:
		total_attack = Global.Comp3.t3_a1(total_attack)
	else:
		total_defense = Global.Comp3.t3_a1(total_defense)
	Global.Comp3.SP -= Global.Comp3.T3A1_cost
	$Buttons/Comp3.visible = false
	await log_process_text(Global.Comp3.T3A1_log)
	PT_Comp4()

func _on_c3_t3_a2_button_pressed():
	if Global.Comp3.T3A2_is_attack:
		total_attack = Global.Comp3.t3_a2(total_attack)
	else:
		total_defense = Global.Comp3.t3_a2(total_defense)
	Global.Comp3.SP -= Global.Comp3.T3A2_cost
	$Buttons/Comp3.visible = false
	await log_process_text(Global.Comp3.T3A2_log)
	PT_Comp4()

func _on_c3_t3_a3_button_pressed():
	if Global.Comp3.T3A3_is_attack:
		total_attack = Global.Comp3.t3_a3(total_attack)
	else:
		total_defense = Global.Comp3.t3_a3(total_defense)
	Global.Comp3.SP -= Global.Comp3.T3A3_cost
	$Buttons/Comp3.visible = false
	await log_process_text(Global.Comp3.T3A3_log)
	PT_Comp4()

func _on_c3_t4_a1_button_pressed():
	if Global.Comp3.T4A1_is_attack:
		total_attack = Global.Comp3.t4_a1(total_attack)
	else:
		total_defense = Global.Comp3.t4_a1(total_defense)
	Global.Comp3.SP -= Global.Comp3.T4A1_cost
	$Buttons/Comp3.visible = false
	await log_process_text(Global.Comp3.T4A1_log)
	PT_Comp4()

func _on_c3_t4_a2_button_pressed():
	if Global.Comp3.T4A2_is_attack:
		total_attack = Global.Comp3.t4_a2(total_attack)
	else:
		total_defense = Global.Comp3.t4_a2(total_defense)
	Global.Comp3.SP -= Global.Comp3.T4A2_cost
	$Buttons/Comp3.visible = false
	await log_process_text(Global.Comp3.T4A2_log)
	PT_Comp4()

func _on_c3_t4_a3_button_pressed():
	if Global.Comp3.T4A3_is_attack:
		total_attack = Global.Comp3.t4_a3(total_attack)
	else:
		total_defense = Global.Comp3.t4_a3(total_defense)
	Global.Comp3.SP -= Global.Comp3.T4A3_cost
	$Buttons/Comp3.visible = false
	await log_process_text(Global.Comp3.T4A3_log)
	PT_Comp4()

func _on_c3_wait_button_pressed():
	Global.Comp3.SP += int(0.1 * Global.Comp3.SPMax)
	if Global.Comp3.SP > Global.Comp3.SPMax:
		Global.Comp3.SP = Global.Comp3.SPMax
	$Buttons/Comp3.visible = false
	await log_process_text(Global.Comp3.Name + " waits")
	PT_Comp4()

func _on_c3_swap_button_pressed():
	$Buttons/Comp3/C3T1Button.visible = false
	$Buttons/Comp3/C3T1A1Button.visible = false
	$Buttons/Comp3/C3T1A2Button.visible = false
	$Buttons/Comp3/C3T1A3Button.visible = false
	$Buttons/Comp3/C3T2Button.visible = false
	$Buttons/Comp3/C3T2A1Button.visible = false
	$Buttons/Comp3/C3T2A2Button.visible = false
	$Buttons/Comp3/C3T2A3Button.visible = false
	$Buttons/Comp3/C3T3Button.visible = false
	$Buttons/Comp3/C3T3A1Button.visible = false
	$Buttons/Comp3/C3T3A2Button.visible = false
	$Buttons/Comp3/C3T3A3Button.visible = false
	$Buttons/Comp3/C3T4Button.visible = false
	$Buttons/Comp3/C3T4A1Button.visible = false
	$Buttons/Comp3/C3T4A2Button.visible = false
	$Buttons/Comp3/C3T4A3Button.visible = false
	$Buttons/Comp3/C3SwapButton.visible = false
	$Buttons/Comp3/C3WaitButton.visible = false
	$Buttons/Comp3/SwapButtons.visible = true

func _on_c3_s1_button_pressed():
	var temp = Global.Comp3
	Global.Comp3 = Global.Comp1
	Global.Comp1 = temp
	$TeamOrder/Slot1.texture = ResourceLoader.load(Global.Comp1.IconBattleFP)
	$TeamOrder/Slot3.texture = ResourceLoader.load(Global.Comp3.IconBattleFP)
	$Player/Comp1.texture = ResourceLoader.load(Global.Comp1.SpriteBattleFP)
	$Player/Comp3.texture = ResourceLoader.load(Global.Comp3.SpriteBattleFP)
	$Buttons/Comp3.visible = false
	$Buttons/Comp3/SwapButtons.visible = false
	await log_process_text(Global.Comp1.Name + " has swapped with " + Global.Comp3.Name)
	PT_Comp4()

func _on_c3_s2_button_pressed():
	var temp = Global.Comp3
	Global.Comp3 = Global.Comp2
	Global.Comp2 = temp
	$TeamOrder/Slot3.texture = ResourceLoader.load(Global.Comp3.IconBattleFP)
	$TeamOrder/Slot2.texture = ResourceLoader.load(Global.Comp2.IconBattleFP)
	$Player/Comp3.texture = ResourceLoader.load(Global.Comp3.SpriteBattleFP)
	$Player/Comp2.texture = ResourceLoader.load(Global.Comp2.SpriteBattleFP)
	$Buttons/Comp3.visible = false
	$Buttons/Comp3/SwapButtons.visible = false
	await log_process_text(Global.Comp3.Name + " has swapped with " + Global.Comp2.Name)
	PT_Comp4()

func _on_c3_s4_button_pressed():
	var temp = Global.Comp3
	Global.Comp3 = Global.Comp4
	Global.Comp4 = temp
	$TeamOrder/Slot3.texture = ResourceLoader.load(Global.Comp3.IconBattleFP)
	$TeamOrder/Slot4.texture = ResourceLoader.load(Global.Comp4.IconBattleFP)
	$Player/Comp3.texture = ResourceLoader.load(Global.Comp3.SpriteBattleFP)
	$Player/Comp4.texture = ResourceLoader.load(Global.Comp4.SpriteBattleFP)
	$Buttons/Comp3.visible = false
	$Buttons/Comp3/SwapButtons.visible = false
	await log_process_text(Global.Comp4.Name + " has swapped with " + Global.Comp3.Name)
	PT_Comp4()

#endregion

#region Companion 4
func PT_Comp4():
	$TeamOrder/Label.text = Global.Comp4.Name + " SP: " + str(Global.Comp4.SP)
	$Buttons/Comp4/C4T1A1Button/Label.text = Global.Comp4.T1A1_name
	$Buttons/Comp4/SwapButtons.visible = false
	$Buttons/Comp4/C4T1Button.visible = true
	$Buttons/Comp4/C4T1A1Button.visible = true
	if Global.Comp4.T1A2_unlock:
		$Buttons/Comp4/C4T1A2Button/Label.text = Global.Comp4.T1A2_name
		$Buttons/Comp4/C4T1A2Button.visible = true
		if Global.Comp4.SP < Global.Comp4.T1A2_cost:
			$Buttons/Comp4/C4T1A2Button.disabled = true
		else:
			$Buttons/Comp4/C4T1A2Button.disabled = false
	if Global.Comp4.T1A3_unlock:
		$Buttons/Comp4/C4T1A3Button/Label.text = Global.Comp4.T1A3_name
		$Buttons/Comp4/C4T1A3Button.visible = true
		if Global.Comp4.SP < Global.Comp4.T1A3_cost:
			$Buttons/Comp4/C4T1A3Button.disabled = true
		else:
			$Buttons/Comp4/C4T1A3Button.disabled = false
	
	if Global.Comp4.T2_unlock:
		$Buttons/Comp4/C4T2Button.visible = true
	if Global.Comp4.T3_unlock:
		$Buttons/Comp4/C4T3Button.visible = true
	if Global.Comp4.T4_unlock:
		$Buttons/Comp4/C4T4Button.visible = true
	
	$Buttons/Comp4/C4SwapButton.visible = true
	$Buttons/Comp4/C4WaitButton.visible = true
	if Global.Comp4.SP < Global.Comp4.T1A1_cost:
		$Buttons/Comp4/C4T1A1Button.disabled = true
	else:
		$Buttons/Comp4/C4T1A1Button.disabled = false
	
	$Buttons/Comp4.visible = true

func _on_c4_t1_button_pressed():
	$Buttons/Comp4/C4T2A1Button.visible = false
	$Buttons/Comp4/C4T2A2Button.visible = false
	$Buttons/Comp4/C4T2A3Button.visible = false
	$Buttons/Comp4/C4T3A1Button.visible = false
	$Buttons/Comp4/C4T3A2Button.visible = false
	$Buttons/Comp4/C4T3A3Button.visible = false
	$Buttons/Comp4/C4T4A1Button.visible = false
	$Buttons/Comp4/C4T4A2Button.visible = false
	$Buttons/Comp4/C4T4A3Button.visible = false
	$Buttons/Comp4/C4T1A1Button.visible = true
	if Global.Comp4.SP < Global.Comp4.T1A1_cost:
		$Buttons/Comp4/C4T1A1Button.disabled = true
	else:
		$Buttons/Comp4/C4T1A1Button.disabled = false
	if Global.Comp4.T1A2_unlock:
		$Buttons/Comp4/C4T1A2Button/Label.text = Global.Comp4.T1A2_name
		$Buttons/Comp4/C4T1A2Button.visible = true
		if Global.Comp4.SP < Global.Comp4.T1A2_cost:
			$Buttons/Comp4/C4T1A2Button.disabled = true
		else:
			$Buttons/Comp4/C4T1A2Button.disabled = false
	if Global.Comp4.T1A3_unlock:
		$Buttons/Comp4/C4T1A3Button/Label.text = Global.Comp4.T1A3_name
		$Buttons/Comp4/C4T1A3Button.visible = true
		if Global.Comp4.SP < Global.Comp4.T1A3_cost:
			$Buttons/Comp4/C4T1A3Button.disabled = true
		else:
			$Buttons/Comp4/C4T1A3Button.disabled = false

func _on_c4_t2_button_pressed():
	$Buttons/Comp4/C4T1A1Button.visible = false
	$Buttons/Comp4/C4T1A2Button.visible = false
	$Buttons/Comp4/C4T1A3Button.visible = false
	$Buttons/Comp4/C4T3A1Button.visible = false
	$Buttons/Comp4/C4T3A2Button.visible = false
	$Buttons/Comp4/C4T3A3Button.visible = false
	$Buttons/Comp4/C4T4A1Button.visible = false
	$Buttons/Comp4/C4T4A2Button.visible = false
	$Buttons/Comp4/C4T4A3Button.visible = false
	$Buttons/Comp4/C4T2A1Button.visible = true
	$Buttons/Comp4/C4T2A1Button/Label.text = Global.Comp4.T2A1_name
	if Global.Comp4.SP < Global.Comp4.T2A1_cost:
		$Buttons/Comp4/C4T2A1Button.disabled = true
	else:
		$Buttons/Comp4/C4T2A1Button.disabled = false
	if Global.Comp4.T2A2_unlock:
		$Buttons/Comp4/C4T2A2Button/Label.text = Global.Comp4.T2A2_name
		$Buttons/Comp4/C4T2A2Button.visible = true
		if Global.Comp4.SP < Global.Comp4.T2A2_cost:
			$Buttons/Comp4/C4T2A2Button.disabled = true
		else:
			$Buttons/Comp4/C4T2A2Button.disabled = false
	if Global.Comp4.T2A3_unlock:
		$Buttons/Comp4/C4T2A3Button/Label.text = Global.Comp4.T2A3_name
		$Buttons/Comp4/C4T2A3Button.visible = true
		if Global.Comp4.SP < Global.Comp4.T2A3_cost:
			$Buttons/Comp4/C4T2A3Button.disabled = true
		else:
			$Buttons/Comp4/C4T2A3Button.disabled = false

func _on_c4_t3_button_pressed():
	$Buttons/Comp4/C4T1A1Button.visible = false
	$Buttons/Comp4/C4T1A2Button.visible = false
	$Buttons/Comp4/C4T1A3Button.visible = false
	$Buttons/Comp4/C4T2A1Button.visible = false
	$Buttons/Comp4/C4T2A2Button.visible = false
	$Buttons/Comp4/C4T2A3Button.visible = false
	$Buttons/Comp4/C4T4A1Button.visible = false
	$Buttons/Comp4/C4T4A2Button.visible = false
	$Buttons/Comp4/C4T4A3Button.visible = false
	$Buttons/Comp4/C4T3A1Button.visible = true
	$Buttons/Comp4/C4T3A1Button/Label.text = Global.Comp4.T3A1_name
	if Global.Comp4.SP < Global.Comp4.T3A1_cost:
		$Buttons/Comp4/C4T3A1Button.disabled = true
	else:
		$Buttons/Comp4/C4T3A1Button.disabled = false
	if Global.Comp4.T3A2_unlock:
		$Buttons/Comp4/C4T3A2Button/Label.text = Global.Comp4.T3A2_name
		$Buttons/Comp4/C4T3A2Button.visible = true
		if Global.Comp4.SP < Global.Comp4.T3A2_cost:
			$Buttons/Comp4/C4T3A2Button.disabled = true
		else:
			$Buttons/Comp4/C4T3A2Button.disabled = false
	if Global.Comp4.T3A3_unlock:
		$Buttons/Comp4/C4T3A3Button/Label.text = Global.Comp4.T3A3_name
		$Buttons/Comp4/C4T3A3Button.visible = true
		if Global.Comp4.SP < Global.Comp4.T3A3_cost:
			$Buttons/Comp4/C4T3A3Button.disabled = true
		else:
			$Buttons/Comp4/C4T3A3Button.disabled = false

func _on_c4_t4_button_pressed():
	$Buttons/Comp4/C4T1A1Button.visible = false
	$Buttons/Comp4/C4T1A2Button.visible = false
	$Buttons/Comp4/C4T1A3Button.visible = false
	$Buttons/Comp4/C4T2A1Button.visible = false
	$Buttons/Comp4/C4T2A2Button.visible = false
	$Buttons/Comp4/C4T2A3Button.visible = false
	$Buttons/Comp4/C4T3A1Button.visible = false
	$Buttons/Comp4/C4T3A2Button.visible = false
	$Buttons/Comp4/C4T3A3Button.visible = false
	$Buttons/Comp4/C4T4A1Button.visible = true
	$Buttons/Comp4/C4T4A1Button/Label.text = Global.Comp4.T4A1_name
	if Global.Comp4.SP < Global.Comp4.T4A1_cost:
		$Buttons/Comp4/C4T4A1Button.disabled = true
	else:
		$Buttons/Comp4/C4T4A1Button.disabled = false
	if Global.Comp4.T4A2_unlock:
		$Buttons/Comp4/C4T4A2Button/Label.text = Global.Comp4.T4A2_name
		$Buttons/Comp4/C4T4A2Button.visible = true
		if Global.Comp4.SP < Global.Comp4.T4A2_cost:
			$Buttons/Comp4/C4T4A2Button.disabled = true
		else:
			$Buttons/Comp4/C4T4A2Button.disabled = false
	if Global.Comp4.T4A3_unlock:
		$Buttons/Comp4/C4T4A3Button/Label.text = Global.Comp4.T4A3_name
		$Buttons/Comp4/C4T4A3Button.visible = true
		if Global.Comp4.SP < Global.Comp4.T4A3_cost:
			$Buttons/Comp4/C4T4A3Button.disabled = true
		else:
			$Buttons/Comp4/C4T4A3Button.disabled = false

func _on_c4_t1_a1_button_pressed():
	if Global.Comp4.T1A1_is_attack:
		total_attack = Global.Comp4.t1_a1(total_attack)
	else:
		total_defense = Global.Comp4.t1_a1(total_defense)
	Global.Comp4.SP -= Global.Comp4.T1A1_cost
	$Buttons/Comp4.visible = false
	await log_process_text(Global.Comp4.T1A1_log)
	PT_Extor()

func _on_c4_t1_a2_button_pressed():
	if Global.Comp4.T1A2_is_attack:
		total_attack = Global.Comp4.t1_a2(total_attack)
	else:
		total_defense = Global.Comp4.t1_a2(total_defense)
	Global.Comp4.SP -= Global.Comp4.T1A2_cost
	$Buttons/Comp4.visible = false
	await log_process_text(Global.Comp4.T1A2_log)
	PT_Extor()

func _on_c4_t1_a3_button_pressed():
	if Global.Comp4.T1A3_is_attack:
		total_attack = Global.Comp4.t1_a3(total_attack)
	else:
		total_defense = Global.Comp4.t1_a3(total_defense)
	Global.Comp4.SP -= Global.Comp4.T1A3_cost
	$Buttons/Comp4.visible = false
	await log_process_text(Global.Comp4.T1A3_log)
	PT_Extor()

func _on_c4_t2_a1_button_pressed():
	if Global.Comp4.T2A1_is_attack:
		total_attack = Global.Comp4.t2_a1(total_attack)
	else:
		total_defense = Global.Comp4.t2_a1(total_defense)
	Global.Comp4.SP -= Global.Comp4.T2A1_cost
	$Buttons/Comp4.visible = false
	await log_process_text(Global.Comp4.T2A1_log)
	PT_Extor()

func _on_c4_t2_a2_button_pressed():
	if Global.Comp4.T2A2_is_attack:
		total_attack = Global.Comp4.t2_a2(total_attack)
	else:
		total_defense = Global.Comp4.t2_a2(total_defense)
	Global.Comp4.SP -= Global.Comp4.T2A2_cost
	$Buttons/Comp4.visible = false
	await log_process_text(Global.Comp4.T2A2_log)
	PT_Extor()

func _on_c4_t2_a3_button_pressed():
	if Global.Comp4.T2A3_is_attack:
		total_attack = Global.Comp4.t2_a3(total_attack)
	else:
		total_defense = Global.Comp4.t2_a3(total_defense)
	Global.Comp4.SP -= Global.Comp4.T2A3_cost
	$Buttons/Comp4.visible = false
	await log_process_text(Global.Comp4.T2A3_log)
	PT_Extor()

func _on_c4_t3_a1_button_pressed():
	if Global.Comp4.T3A1_is_attack:
		total_attack = Global.Comp4.t3_a1(total_attack)
	else:
		total_defense = Global.Comp4.t3_a1(total_defense)
	Global.Comp4.SP -= Global.Comp4.T3A1_cost
	$Buttons/Comp4.visible = false
	await log_process_text(Global.Comp4.T3A1_log)
	PT_Extor()

func _on_c4_t3_a2_button_pressed():
	if Global.Comp4.T3A2_is_attack:
		total_attack = Global.Comp4.t3_a2(total_attack)
	else:
		total_defense = Global.Comp4.t3_a2(total_defense)
	Global.Comp4.SP -= Global.Comp4.T3A2_cost
	$Buttons/Comp4.visible = false
	await log_process_text(Global.Comp4.T3A2_log)
	PT_Extor()

func _on_c4_t3_a3_button_pressed():
	if Global.Comp4.T3A3_is_attack:
		total_attack = Global.Comp4.t3_a3(total_attack)
	else:
		total_defense = Global.Comp4.t3_a3(total_defense)
	Global.Comp4.SP -= Global.Comp4.T3A3_cost
	$Buttons/Comp4.visible = false
	await log_process_text(Global.Comp4.T3A3_log)
	PT_Extor()

func _on_c4_t4_a1_button_pressed():
	if Global.Comp4.T4A1_is_attack:
		total_attack = Global.Comp4.t4_a1(total_attack)
	else:
		total_defense = Global.Comp4.t4_a1(total_defense)
	Global.Comp4.SP -= Global.Comp4.T4A1_cost
	$Buttons/Comp4.visible = false
	await log_process_text(Global.Comp4.T4A1_log)
	PT_Extor()

func _on_c4_t4_a2_button_pressed():
	if Global.Comp4.T4A2_is_attack:
		total_attack = Global.Comp4.t4_a2(total_attack)
	else:
		total_defense = Global.Comp4.t4_a2(total_defense)
	Global.Comp4.SP -= Global.Comp4.T4A2_cost
	$Buttons/Comp4.visible = false
	await log_process_text(Global.Comp4.T4A2_log)
	PT_Extor()

func _on_c4_t4_a3_button_pressed():
	if Global.Comp4.T4A3_is_attack:
		total_attack = Global.Comp4.t4_a3(total_attack)
	else:
		total_defense = Global.Comp4.t4_a3(total_defense)
	Global.Comp4.SP -= Global.Comp4.T4A3_cost
	$Buttons/Comp4.visible = false
	await log_process_text(Global.Comp4.T4A3_log)
	PT_Extor()

func _on_c4_wait_button_pressed():
	Global.Comp4.SP += int(0.1 * Global.Comp4.SPMax)
	if Global.Comp4.SP > Global.Comp4.SPMax:
		Global.Comp4.SP = Global.Comp4.SPMax
	$Buttons/Comp4.visible = false
	await log_process_text(Global.Comp4.Name + " waits")
	PT_Extor()

func _on_c4_swap_button_pressed():
	$Buttons/Comp4/C4T1Button.visible = false
	$Buttons/Comp4/C4T1A1Button.visible = false
	$Buttons/Comp4/C4T1A2Button.visible = false
	$Buttons/Comp4/C4T1A3Button.visible = false
	$Buttons/Comp4/C4T2Button.visible = false
	$Buttons/Comp4/C4T2A1Button.visible = false
	$Buttons/Comp4/C4T2A2Button.visible = false
	$Buttons/Comp4/C4T2A3Button.visible = false
	$Buttons/Comp4/C4T3Button.visible = false
	$Buttons/Comp4/C4T3A1Button.visible = false
	$Buttons/Comp4/C4T3A2Button.visible = false
	$Buttons/Comp4/C4T3A3Button.visible = false
	$Buttons/Comp4/C4T4Button.visible = false
	$Buttons/Comp4/C4T4A1Button.visible = false
	$Buttons/Comp4/C4T4A2Button.visible = false
	$Buttons/Comp4/C4T4A3Button.visible = false
	$Buttons/Comp4/C4SwapButton.visible = false
	$Buttons/Comp4/C4WaitButton.visible = false
	$Buttons/Comp4/SwapButtons.visible = true

func _on_c4_s1_button_pressed():
	var temp = Global.Comp4
	Global.Comp4 = Global.Comp1
	Global.Comp1 = temp
	$TeamOrder/Slot1.texture = ResourceLoader.load(Global.Comp1.IconBattleFP)
	$TeamOrder/Slot4.texture = ResourceLoader.load(Global.Comp4.IconBattleFP)
	$Player/Comp1.texture = ResourceLoader.load(Global.Comp1.SpriteBattleFP)
	$Player/Comp4.texture = ResourceLoader.load(Global.Comp4.SpriteBattleFP)
	$Buttons/Comp4.visible = false
	$Buttons/Comp4/SwapButtons.visible = false
	await log_process_text(Global.Comp1.Name + " has swapped with " + Global.Comp4.Name)
	PT_Extor()

func _on_c4_s2_button_pressed():
	var temp = Global.Comp4
	Global.Comp4 = Global.Comp2
	Global.Comp2 = temp
	$TeamOrder/Slot4.texture = ResourceLoader.load(Global.Comp4.IconBattleFP)
	$TeamOrder/Slot2.texture = ResourceLoader.load(Global.Comp2.IconBattleFP)
	$Player/Comp4.texture = ResourceLoader.load(Global.Comp4.SpriteBattleFP)
	$Player/Comp2.texture = ResourceLoader.load(Global.Comp2.SpriteBattleFP)
	$Buttons/Comp4.visible = false
	$Buttons/Comp4/SwapButtons.visible = false
	await log_process_text(Global.Comp2.Name + " has swapped with " + Global.Comp4.Name)
	PT_Extor()

func _on_c4_s3_button_pressed():
	var temp = Global.Comp3
	Global.Comp3 = Global.Comp4
	Global.Comp4 = temp
	$TeamOrder/Slot3.texture = ResourceLoader.load(Global.Comp3.IconBattleFP)
	$TeamOrder/Slot4.texture = ResourceLoader.load(Global.Comp4.IconBattleFP)
	$Player/Comp3.texture = ResourceLoader.load(Global.Comp3.SpriteBattleFP)
	$Player/Comp4.texture = ResourceLoader.load(Global.Comp4.SpriteBattleFP)
	$Buttons/Comp4.visible = false
	$Buttons/Comp4/SwapButtons.visible = false
	await log_process_text(Global.Comp3.Name + " has swapped with " + Global.Comp4.Name)
	PT_Extor()
#endregion

#region Extor
func PT_Extor():
	$TeamOrder/Label.text = "Extor's SP: " + str(Global.PlayerAPCur)
	$Buttons/Extor/EAttackButton.visible = true
	$Buttons/Extor/EDefendButton.visible = true
	$Buttons/Extor/Specials.visible = false
	if Global.PlayerAPCur < 20:
		$Buttons/Extor/ESpecialsButton.visible = false
	else:
		$Buttons/Extor/ESpecialsButton.visible = true
	$Buttons/Extor.visible = true

func _on_e_attack_button_pressed():
	$Buttons/Extor.visible = false
	total_defense = Global.PlayerDefense
	await log_process_text("Extor attacks")
	await damage_enemy(total_attack)
	ET_start()

func _on_e_defend_button_pressed():
	$Buttons/Extor.visible = false
	await log_process_text("Extor defends")
	ET_start()

func _on_e_specials_button_pressed():
	$Buttons/Extor/EAttackButton.visible = false
	$Buttons/Extor/EDefendButton.visible = false
	$Buttons/Extor/ESpecialsButton.visible = false
	$Buttons/Extor/Specials.visible = true

func _on_all_out_atk_button_pressed():
	$Buttons/Extor.visible = false
	Global.PlayerAPCur -= 20
	total_attack = total_attack + total_defense
	total_defense = 0
	await log_process_text("Extor goes all out ATK")
	await damage_enemy(total_attack)
	ET_start()

func _on_all_out_def_button_pressed():
	$Buttons/Extor.visible = false
	Global.PlayerAPCur -= 20
	total_defense = total_attack + total_defense
	total_attack = 0
	await log_process_text("Extor goes all out DEF")
	ET_start()

#endregion

#endregion


#region CORE Functions
func battle_start():
	await log_process_text(Global.Enemy.Name + " has appeared!!")
	await log_process_text(Global.Enemy.Name + " has appeared!! But test!")
	PT_Comp1()

func damage_enemy(damage):
	var act_damage = damage - total_defense_e
	if act_damage < 0:
		act_damage = 0
	enemy_current_health -= act_damage
	var tween = get_tree().create_tween()
	tween.tween_property($HealthBars/EnemyHealth, "value", enemy_current_health, 0.5)
	await get_tree().create_timer(1.0).timeout
	if enemy_current_health <= 0:
		await log_process_text(Global.Enemy.Name + "has been defeated")
		await log_process_text("Currency rewarded: " + str(Global.Enemy.Reward))
		await get_tree().create_timer(1.0).timeout
		Global.PlayerCurrency += Global.Enemy.Reward
		Global.PlayerMove = true
		queue_free()

func damage_extor(damage):
	var act_damage = damage - total_defense
	if act_damage < 0:
		act_damage = 0
	Global.PlayerCurHealth -= act_damage
	var tween = get_tree().create_tween()
	tween.tween_property($HealthBars/PlayerHealth, "value", Global.PlayerCurHealth, 0.5)
	await get_tree().create_timer(1.0).timeout
	if Global.PlayerCurHealth <= 0:
		await log_process_text("Extor has been defeated")
		await log_process_text("Currency lost forever: " + str(Global.PlayerCurrency))
		await get_tree().create_timer(1.0).timeout
		Global.PlayerCurrency = 0
		Global.GOTO_town_test()
		Global.CORE_refill_HPSP()
		Global.PlayerMove = true
		queue_free()
#endregion






