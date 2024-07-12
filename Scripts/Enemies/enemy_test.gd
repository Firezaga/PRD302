extends Sprite2D

var Name = "Octospider"
var SpriteFP = "res://Art/Enemies/Octospider.png"
var MaxHP = 200
var HP = 200
var AttackMax = 200
var AttackMin = 150
var Defense = 10
var Reward = 20



func attack(base):
	var damage = randi_range(AttackMin, AttackMax)
	return damage + base

func defend(base):
	return Defense + base


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
