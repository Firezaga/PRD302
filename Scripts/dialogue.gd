extends CanvasLayer

var raw_text
var can_skip = true

# Called when the node enters the scene tree for the first time.
func _ready():
	$SceneBackground.texture = ResourceLoader.load(Global.DiaBackground)
	$SpriteLeft.texture = ResourceLoader.load(Global.DiaSpriteLeft)
	$SpriteRight.texture = ResourceLoader.load(Global.DiaSpriteRight)
	raw_text = Global.DiaText
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
			await get_tree().create_timer(2.0).timeout
			text_to_send = ""
			continue
		text_to_send += raw_text[i]


func DisplayText(text):
	$TextBackground/Label.text = ""
	for i in len(text):
		if Input.is_action_pressed("skip") && can_skip:
			can_skip = false
			$TextBackground/Label.text = text
			$DiaTimer.start()
			break
		$TextBackground/Label.text += text[i]
		await get_tree().create_timer(0.01).timeout


func _on_dia_timer_timeout():
	can_skip = true
