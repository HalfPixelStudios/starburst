extends CharacterBody2D

@export var bullet: PackedScene = preload("res://scenes/Bullet.tscn")
@export var speed: float = 10

func _ready():
	$ShootTimer.start()


func _physics_process(delta):
	
	# Make enemy move back and forth
	var dir = Vector2(1.0, 0.0)
	velocity = dir * speed

	move_and_slide()

func _on_shoot_timer_timeout():
	
	var inst = bullet.instantiate()
	inst.position = self.position
	get_tree().current_scene.add_child(inst)
