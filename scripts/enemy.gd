class_name Enemy extends Area2D

@export var bullet: PackedScene = preload("res://scenes/PlayerBullet.tscn")
@export var speed: float = 10 

func _ready():
	$ShootTimer.start()
	area_entered.connect(_on_area_entered)

func _physics_process(delta):
	
	# Make enemy move back and forth
	var dir = Vector2(1.0, 0.0)
	#velocity = dir * speed

	#move_and_slide()

func _on_area_entered(area):
	if area is PlayerBullet:
		die()
	
func _on_shoot_timer_timeout():
	
	# var inst = bullet.instantiate()
	# inst.position = self.position
	# get_tree().current_scene.add_child(inst)
	pass

func die():
	queue_free()
	

