extends Node2D

@onready var player = $Player
@onready var bullet_container = $BulletContainer

func _ready():
	player.bullet_shoot.connect(_on_player_bullet_shoot)

func _process(_delta):
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
		
	if Input.is_action_just_pressed("restart"):
		get_tree().reload_current_scene()

func _on_player_bullet_shoot(bullet_scene, location):
	var bullet = bullet_scene.instantiate()
	bullet.global_position = location
	bullet_container.add_child(bullet)
	bullet.dir = Vector2(0, -1)
	
