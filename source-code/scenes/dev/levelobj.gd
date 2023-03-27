extends TileMap
class_name InteractiveTilemap

# https://www.youtube.com/watch?v=O4AQtCWNQmo
# the tutorial i used to make this

export(Dictionary) var TILE_SCENES := {
	0: preload("res://scenes/player/testplayer.tscn"),
	1: preload("res://scenes/objects/main/checkpoint.tscn"),
	3: preload("res://scenes/objects/main/Hcoin.tscn"),
	4: preload("res://scenes/objects/main/Fheal.tscn"),
	5: preload("res://scenes/objects/main/Box-empty.tscn"),
	8: preload("res://scenes/enemies/Slidey.tscn")
}

onready var half_cell_size := cell_size * 0.5


func _ready():
	yield(get_tree(), "idle_frame")
	_replace_tiles_with_scenes()

func _replace_tiles_with_scenes(scene_dictionary: Dictionary = TILE_SCENES):
	for tile_pos in get_used_cells():
		var tile_id = get_cell(tile_pos.x, tile_pos.y)
		
		if scene_dictionary.has(tile_id):
			var object_scene = scene_dictionary[tile_id]
			_replace_tile_with_object(tile_pos, object_scene)

func _replace_tile_with_object(tile_pos: Vector2, object_scene: PackedScene, parent: Node = get_tree().current_scene):
	# Clear the cell in TileMap
	if get_cellv(tile_pos) != INVALID_CELL:
		set_cellv(tile_pos, -1)
		update_bitmask_region()
	
	# Spawn the object
	if object_scene:
		var obj = object_scene.instance()
		var ob_pos = map_to_world(tile_pos) + half_cell_size
		
		parent.add_child(obj)
		obj.global_position = to_global(ob_pos)
