extends Control


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
