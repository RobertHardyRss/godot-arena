extends Camera2D

@export var tile_map_layer: TileMapLayer


func _ready():
	if tile_map_layer == null:
		return
	
	var map_bounds = tile_map_layer.get_used_rect()
	var tile_size = tile_map_layer.tile_set.tile_size
	var world_size_pixels = map_bounds.size * tile_size
	
	limit_right = world_size_pixels.x
	limit_bottom = world_size_pixels.y
	
