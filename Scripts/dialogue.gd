#region Dialogue Instructions
# Normal
# '~' is used to seperate blocks of text for processing to the text box
# '%' is used to end the dialogue scene
# Example below
# Simple placeholder text.~Some more simple placeholder text.~

# Multi Choice
# There are 7 variables used in multi choice dialogue, seperated by '^', except the button text other strings can be broken up using '~', '@' reveals the buttons
# Example string below
# ^Placeholder text for the start of the conversation.~@^Button 1 Placehold^Button 2 Placehold^Button 3 Placehold^Reply 1%^Reply 2%^Reply 3%^
#endregion


extends CanvasLayer

var raw_text
var can_skip = true

var base_text
var button_1_text
var button_2_text
var button_3_text
var reply_1
var reply_2
var reply_3

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().paused = true
	$SceneBackground.texture = ResourceLoader.load(Global.DiaBackground)
	if !(Global.DiaSpriteLeft == ""):
		$SpriteLeft.texture = ResourceLoader.load(Global.DiaSpriteLeft)
	if !(Global.DiaSpriteRight == ""):
		$SpriteRight.texture = ResourceLoader.load(Global.DiaSpriteRight)
	raw_text = Global.DiaText
	if raw_text[0] == '^':
		ProMulti()
	else:
		ProText()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


#Process text
func ProText():
	var text_to_send = ""
	for i in len(raw_text):
		if raw_text[i] == '~':
			await DisplayText(text_to_send)
			await advancedialog
			text_to_send = ""
			continue
		if raw_text[i] == '%':
			await DisplayText(text_to_send)
			await advancedialog
			Global.DiaFinished = true
			get_tree().paused = false
			queue_free()
		text_to_send += raw_text[i]

func ProTextM(text):
	var text_to_send = ""
	for i in len(text):
		if text[i] == '~':
			await DisplayText(text_to_send)
			await get_tree().create_timer(5.0).timeout
			text_to_send = ""
			continue
		if (text[i] == '@'):
			$Choice.visible = true
		if text[i] == '%':
			await DisplayText(text_to_send)
			await get_tree().create_timer(5.0).timeout
			Global.DiaFinished = true
			get_tree().paused = false
			queue_free()
		text_to_send += text[i]

func ProMulti():
	var count = 0
	var text_temp = ""
	for i in len(raw_text):
		if i == 0:
			continue
		
		if (raw_text[i] == '^') && (count == 0):
			base_text = text_temp
			count += 1
			text_temp = ""
			continue
		elif (raw_text[i] == '^') && (count == 1):
			button_1_text = text_temp
			$Choice/Button1/Label.text = text_temp
			count += 1
			text_temp = ""
			continue
		elif (raw_text[i] == '^') && (count == 2):
			button_2_text = text_temp
			$Choice/Button2/Label.text = text_temp
			count += 1
			text_temp = ""
			continue
		elif (raw_text[i] == '^') && (count == 3):
			button_3_text = text_temp
			$Choice/Button3/Label.text = text_temp
			count += 1
			text_temp = ""
			continue
		elif (raw_text[i] == '^') && (count == 4):
			reply_1 = text_temp
			count += 1
			text_temp = ""
			continue
		elif (raw_text[i] == '^') && (count == 5):
			reply_2 = text_temp
			count += 1
			text_temp = ""
			continue
		elif (raw_text[i] == '^') && (count == 6):
			reply_3 = text_temp
			count += 1
			text_temp = ""
			continue
		
		text_temp += raw_text[i]
	ProTextM(base_text)



signal advancedialog
func _input(event):
	if Input.is_action_just_pressed("AdvanceDialog"):
		advancedialog.emit()
		
# Display Text
func DisplayText(text):
	$TextBackground/Label.text = ""
	for i in len(text):
		if Input.is_action_just_pressed("skip") && can_skip:
			can_skip = false
			$TextBackground/Label.text = text
			$DiaTimer.start()
			break
		$TextBackground/Label.text += text[i]
		await get_tree().create_timer(0.01).timeout

func _on_dia_timer_timeout():
	can_skip = true


func _on_button_1_pressed():
	$Choice.visible = false
	ProTextM(reply_1)


func _on_button_2_pressed():
	$Choice.visible = false
	ProTextM(reply_2)


func _on_button_3_pressed():
	$Choice.visible = false
	ProTextM(reply_3)


func _on_texture_button_pressed():
	Global.DiaFinished = true
	get_tree().paused = false
	queue_free()
