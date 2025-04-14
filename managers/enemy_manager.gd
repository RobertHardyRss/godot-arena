extends Node

@export var enemy_scene: PackedScene
@export var spawn_radius: int = 100

func _ready():
	$Timer.timeout.connect(on_timer_timeout)


func _process(delta):
	pass


func on_timer_timeout():
	var player = get_tree().get_first_node_in_group("player") as Node2D
	
	if player == null or enemy_scene == null:
		return
	
	var random_direction = Vector2.RIGHT.rotated(randf_range(0, TAU))
	var spawn_position = player.global_position + (random_direction * spawn_radius)
	var enemy = enemy_scene.instantiate() as Node2D
	enemy.global_position = spawn_position
	
	get_parent().add_child(enemy)
	
	
	
	
