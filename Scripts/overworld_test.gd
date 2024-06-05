extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$PlayerOverworld.position.x = Global.PlayerLocX
	$PlayerOverworld.position.y = Global.PlayerLocY


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_area_entered(area):
	Global.GOTO_town_test()
