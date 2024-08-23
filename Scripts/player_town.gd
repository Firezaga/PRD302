extends CharacterBody2D

@export var speed = 1000;
@onready var animation_tree = $AnimationTree

func _process(delta):
	if !Global.PlayerMove:
		return
	velocity = Vector2.ZERO
	#input
	if Input.is_action_pressed("right"):
		isMoving(true)
		velocity.x += 1
		$Sprites.scale.x = 0.3
	elif Input.is_action_pressed("left"):
		isMoving(true)
		velocity.x -= 1
		$Sprites.scale.x = -0.3
	else:
		isMoving(false)
	update_blend_position()

	#if Input.is_action_pressed("up"):
		#velocity.y -= 1
	#if Input.is_action_pressed("down"):
		#velocity.y += 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	
	move_and_slide()

func isMoving(value):
	animation_tree["parameters/conditions/is_running"] = value
	animation_tree["parameters/conditions/is_not_running"] = not value
	
func update_blend_position():
	animation_tree["parameters/Run/blend_position"] = velocity

func _on_pause_button_pressed():
	$SEAudioPlayer.play()
	await get_tree().create_timer(0.5).timeout
	Global.PlayerMove = false
	$PauseMenu.refresh()
	$PauseMenu.visible = true

func MovementTutorial():
	$MovementTutorial.visible = true
