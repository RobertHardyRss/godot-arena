extends CharacterBody2D

@export var base_speed : float = 125
@export var sprint_speed: float = 125
@export var acceleration_smoothing : float = 10

func _ready():
	pass


func _process(delta: float):
	var movement_vector = get_movement_vector()
	var sprint_boost = Input.get_action_strength("sprint") * sprint_speed
	var target_velocity = movement_vector * (base_speed + sprint_boost)
	
	velocity = velocity.lerp(target_velocity, 1 - exp(-delta * acceleration_smoothing))
	move_and_slide()
	

func get_movement_vector():
	var x_movement = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var y_movement = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	
	
	var movement_vector = Vector2(x_movement, y_movement).normalized()
	return movement_vector
	
