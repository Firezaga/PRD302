extends Sprite2D

var Name = "Test Enemy"
var SpriteFP = "res://Art/BlakeTest/PH-Sprite4(AI).jpg"
var MaxHP = 500
var HP = 500
var AttackMax = 15
var AttackMin = 10
var Defense = 10

func attack():
	var damage = randi_range(AttackMin, AttackMax)
	return damage


func defend():
	return Defense


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
