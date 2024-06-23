extends CanvasLayer

var log_array = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


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
	if log_array.size() == 14:
		log_array.pop_front()
	log_array.push_back(text)
	for i in log_array:
		$Log/Label.text += i + "\n"
	for i in len(text):
		$Log/Label.text += text[i]
		await get_tree().create_timer(0.01).timeout
#endregion


#region Enemy Turn

#endregion


#region Player Turn

#endregion


#region CORE Functions

#endregion



