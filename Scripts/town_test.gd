extends Node2D

var can_talk = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("use") && can_talk:
		$SpeechHint.visible = false
		Global.PlayerMove = false
		can_talk = false
	
	#$NPC.rotation -= 0.1 * delta
	$NPC/Sprite2D.rotation -= 0.12 * delta
	$NPC/Sprite2D2.rotation -= 0.09 * delta
	$NPC/Sprite2D3.rotation -= 0.11 * delta


func _on_area_2d_area_entered(area):
	Global.PlayerLocX = 64
	Global.PlayerLocY = 1104
	Global.GOTO_overworld_test()


func _on_npc_area_area_entered(area):
	$SpeechHint.visible = true
	can_talk = true


func _on_npc_area_area_exited(area):
	$SpeechHint.visible = false
	can_talk = false
