extends Node

@export var max_range : float = 150
@export var sword_ability : PackedScene


func _ready():
	if sword_ability == null:
		return
		
	$Timer.timeout.connect(on_timer_timeout)


func on_timer_timeout():
	var player = get_tree().get_first_node_in_group("player") as Node2D
	
	if player == null:
		return
	
	var enemies = get_tree().get_nodes_in_group("enemy")
	
	enemies = enemies.filter(func (e: Node2D): 
		return e.global_position.distance_squared_to(player.global_position) < pow(max_range, 2)
	)
	
	if enemies.size() == 0:
		return
		
	enemies.sort_custom(func (a: Node2D, b: Node2D):
		var a_dist = a.global_position.distance_squared_to(player.global_position)
		var b_dist = b.global_position.distance_squared_to(player.global_position)
		return a_dist < b_dist
	)
	
	var enemy = enemies[0] as Node2D
	
	var sword_instance = sword_ability.instantiate() as Node2D
	player.get_parent().add_child(sword_instance)
	
	sword_instance.global_position = enemy.global_position
	sword_instance.global_position += Vector2.RIGHT.rotated(randf_range(0, TAU)) * 4
	
	var enemy_direction = enemy.global_position - sword_instance.global_position
	sword_instance.rotation = enemy_direction.angle()
	
	
	
	
	
