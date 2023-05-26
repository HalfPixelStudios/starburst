extends CharacterBody2D

@export var speed: float = 100

func _physics_process(delta):
	
	var input_dir = Vector2(
		Input.get_action_strength('right')-Input.get_action_strength('left'),
		Input.get_action_strength('down')-Input.get_action_strength('up')
	)

	#print(input_dir)
	velocity = input_dir * speed

	move_and_slide()
