extends Area2D

@export var speed: int = 200

func _physics_process(delta):
	global_position += Vector2(0, -1) * speed * delta
