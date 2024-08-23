extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	if not FileAccess.file_exists("user://savegame.save"):
		$ContinueButton.disabled = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_new_game_button_pressed():
	$SEAudioPlayer.play()
	await get_tree().create_timer(0.5).timeout
	Global.GOTO_new_game()


func _on_continue_button_pressed():
	$SEAudioPlayer.play()
	await get_tree().create_timer(0.5).timeout
	Global.CORE_load_game()


func _on_settings_button_pressed():
	$SEAudioPlayer.play()
	await get_tree().create_timer(0.5).timeout
	Global.GOTO_settings()


func _on_quit_button_pressed():
	$SEAudioPlayer.play()
	await get_tree().create_timer(0.5).timeout
	Global.CORE_quit()
