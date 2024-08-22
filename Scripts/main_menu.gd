extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	if not FileAccess.file_exists("user://savegame.save"):
		$ContinueButton.disabled = true
	
	Global.BackgroundAudioChange("res://Audio/Background Audio/Main Menu.mp3")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_new_game_button_pressed():
	Global.GOTO_new_game()


func _on_continue_button_pressed():
	Global.CORE_load_game()


func _on_settings_button_pressed():
	Global.GOTO_settings()


func _on_quit_button_pressed():
	Global.CORE_quit()
