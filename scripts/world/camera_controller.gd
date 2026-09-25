extends Camera2D

@export var follow_speed = 5.0
var target_position = Vector2.ZERO

func _ready():
	zoom = Vector2(2.5, 2.5)  # Zoom für Sichtbarkeit
	set_as_current()
	print("Kamera initialisiert - Diablo-2-Style isometrisch")

func _physics_process(delta):
	if get_parent():
		target_position = get_parent().global_position
		global_position = global_position.lerp(target_position, follow_speed * delta)
