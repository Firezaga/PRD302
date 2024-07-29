extends CharacterBody2D

@export var speed = 1000;
@onready var animation_tree = $AnimationTree

func _process(delta):
	if !Global.PlayerMove:
		return
	velocity = Vector2.ZERO
	#input
	if Input.is_action_pressed("right"):
		velocity.x += 1
		$Sprites.scale.x = 0.3
		isMoving(true)
	if Input.is_action_pressed("left"):
		velocity.x -= 1
		$Sprites.scale.x = -0.3
		isMoving(true)
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
	Global.PlayerMove = false
	$PauseMenu.refresh()
	$PauseMenu.visible = true

func MovementTutorial():
	$MovementTutorial.visible = true
