extends CharacterBody2D

const MAX_SPEED = 20

func _process(delta):
	var direction = get_direction_to_player()
	velocity = direction * MAX_SPEED
	move_and_slide()
	
	
func get_direction_to_player():
	var player_node = get_tree().get_first_node_in_group("player") as Node2D
	
	if player_node ==  null:
		return Vector2.ZERO
	
	var direction = (player_node.global_position - global_position).normalized()
	return direction
