extends CharacterBody2D

# Movement
var speed = 200.0
var direction = Vector2.ZERO

# Animation & Sprites
@onready var animated_sprite = $AnimatedSprite2D

func _ready():
	print("Player initialisiert - Abysmus-Station")

func _physics_process(delta):
	# Input Handler
	get_input()
	
	# Bewegung
	if direction != Vector2.ZERO:
		velocity = direction.normalized() * speed
		move_and_slide()
	else:
		velocity = Vector2.ZERO
	
	# Animation Update
	update_animation()

func get_input():
	direction = Vector2.ZERO
	
	# WASD oder Pfeiltasten
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1

func update_animation():
	if direction == Vector2.ZERO:
		if animated_sprite:
			animated_sprite.play("idle")
	else:
		if animated_sprite:
			animated_sprite.play("walk")
