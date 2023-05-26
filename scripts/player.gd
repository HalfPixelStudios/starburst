extends CharacterBody2D

@export var bullet: PackedScene = preload("res://scenes/bullet.tscn")
@export var speed: float = 100

func _physics_process(delta):
	
	# handle movement
	var input_dir = Vector2(
		Input.get_action_strength('right')-Input.get_action_strength('left'),
		Input.get_action_strength('down')-Input.get_action_strength('up')
	)

	velocity = input_dir * speed

	move_and_slide()
	
	# handle shooting
	if Input.is_action_just_pressed('shoot'):
		var inst = bullet.instantiate()
		inst.position = self.position
		get_tree().current_scene.add_child(inst)
