extends CharacterBody2D

signal player_died

@export var SPEED : int = 100
var dead = false

func _physics_process(_delta):
	if dead:
		return

	var movement : Vector2 = Vector2(
		Input.get_axis("left", "right"),
		Input.get_axis("up", "down")
	)
	
	velocity = movement * SPEED
	
	if velocity.x < 0:
		$AnimatedSprite2D.flip_h = true
	elif velocity.x > 0:
		$AnimatedSprite2D.flip_h = false
	
	if velocity != Vector2.ZERO:
		$AnimatedSprite2D.play("walk")
	else:
		$AnimatedSprite2D.play("idle")
	
	move_and_slide()

func die():
	player_died.emit()
	hide()
	$CollisionShape2D.set_deferred("disabled", true)
	dead = true
