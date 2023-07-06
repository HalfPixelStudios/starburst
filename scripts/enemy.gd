class_name Enemy extends Area2D

@onready var bullet_scene: PackedScene = preload("res://scenes/EnemyBullet.tscn")
@onready var bullet_spawn = $Marker2D

func _ready():
	$ShootTimer.start()
	area_entered.connect(_on_area_entered)

	var tween = create_tween().set_loops()
	tween.tween_property(self, "position", Vector2(100.0, 0), 2).as_relative().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_QUART)
	tween.tween_property(self, "position", Vector2(-100.0, 0), 2).as_relative().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_QUART)

func _physics_process(delta):
	
	# Make enemy move back and forth
	#velocity = dir * speed

	#move_and_slide()
	pass

func _on_area_entered(area):
	if area is PlayerBullet:
		die()
	
func _on_shoot_timer_timeout():
	var bullet = bullet_scene.instantiate()
	bullet.global_position = bullet_spawn.global_position
	bullet.dir = Vector2(0, 1)

func die():
	queue_free()
	

