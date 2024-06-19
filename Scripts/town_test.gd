extends Node2D

var can_talk = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("use") && can_talk:
		$Midground/SpeechHint.visible = false
		Global.PlayerMove = false
		can_talk = false
		Global.LOAD_upgrade_shop()
	
	#$NPC.rotation -= 0.1 * delta
	$Midground/NPC/Sprite2D.rotation -= 0.12 * delta
	$Midground/NPC/Sprite2D2.rotation -= 0.09 * delta
	$Midground/NPC/Sprite2D3.rotation -= 0.11 * delta


func _on_area_2d_area_entered(area):
	Global.PlayerLocX = 0
	Global.PlayerLocY = 0
	Global.GOTO_overworld_test()


func _on_npc_area_area_entered(area):
	$Midground/SpeechHint.visible = true
	can_talk = true


func _on_npc_area_area_exited(area):
	$Midground/SpeechHint.visible = false
	can_talk = false
