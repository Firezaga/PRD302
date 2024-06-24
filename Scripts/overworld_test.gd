extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$PlayerOverworld.position.x = Global.PlayerLocX
	$PlayerOverworld.position.y = Global.PlayerLocY


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_area_entered(area):
	Global.CORE_refill_HPSP()
	Global.GOTO_town_test()


func _on_enemy_1_area_entered(area):
	Global.PlayerMove = false
	Global.LOAD_battle("res://Scenes/Enemies/enemy_test.tscn")
	$Enemy1.queue_free()


func _on_enemy_2_area_entered(area):
	Global.PlayerMove = false
	Global.LOAD_battle("res://Scenes/Enemies/enemy_test.tscn")
	$Enemy2.queue_free()


func _on_enemy_3_area_entered(area):
	Global.PlayerMove = false
	Global.LOAD_battle("res://Scenes/Enemies/enemy_test.tscn")
	$Enemy3.queue_free()
