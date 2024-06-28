extends CharacterBody2D

@export var speed = 1000;

var move = true

func _process(delta):
	if !Global.PlayerMove:
		return
	velocity = Vector2.ZERO
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	
	move_and_slide()
	


func _on_pause_button_pressed():
	Global.PlayerMove = false
	$PauseMenu.refresh()
	$PauseMenu.visible = true
