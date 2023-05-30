extends CharacterBody2D

signal bullet_shoot(bullet_scene, spawn_position)

@export var bullet_scene: PackedScene = preload("res://scenes/Bullet.tscn")
@export var speed: float = 100
@onready var bullet_spawn = $Marker2D

func _process(delta):
	# handle shooting
	if Input.is_action_just_pressed('shoot'):
		bullet_shoot.emit(bullet_scene, bullet_spawn.global_position)


func _physics_process(delta):
	
	# handle movement
	var input_dir = Vector2(
		Input.get_action_strength('right')-Input.get_action_strength('left'),
		Input.get_action_strength('down')-Input.get_action_strength('up')
	)

	velocity = input_dir * speed

	move_and_slide()
