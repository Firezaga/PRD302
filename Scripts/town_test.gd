extends Node2D

var can_talk = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("use") && can_talk:
		$NPC/SpeechHint.visible = false
		Global.PlayerMove = false
		can_talk = false


func _on_area_2d_area_entered(area):
	Global.PlayerLocX = 64
	Global.PlayerLocY = 1104
	Global.GOTO_overworld_test()


func _on_npc_area_area_entered(area):
	$NPC/SpeechHint.visible = true
	can_talk = true


func _on_npc_area_area_exited(area):
	$NPC/SpeechHint.visible = false
	can_talk = false
