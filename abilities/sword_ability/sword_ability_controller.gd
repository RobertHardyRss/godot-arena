extends Node

@export var max_range : float = 150



func _ready():
	$Timer.timeout.connect(on_timer_timeout)


func on_timer_timeout():
	var player = get_tree().get_first_node_in_group("player") as Node2D
	
	if player == null:
		return
	
	var enemies = get_tree().get_nodes_in_group("enemy")
	
	if enemies.count(0):
		return
	
	
	
	
