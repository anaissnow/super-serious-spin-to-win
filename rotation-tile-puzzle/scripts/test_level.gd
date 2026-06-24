extends Node2D


@onready var tile_map_layer: TileMapLayer = $TileMapLayer


@export var GridSize = 5
var tile_dict = {}


# helper variable
var flip_h := TileSetAtlasSource.TRANSFORM_FLIP_H
var flip_v := TileSetAtlasSource.TRANSFORM_FLIP_V
var transpose := TileSetAtlasSource.TRANSFORM_TRANSPOSE


var tile_transforms := {
	Vector2i(0, -1): [0],
	Vector2i(1, 0): [flip_h, transpose],
	Vector2i(0, 1): [flip_v, flip_h],
	Vector2i(-1, 0): [flip_v, transpose]
}

var tile_direction := Vector2i(0, -1)
var applied_transform : int


func _ready() -> void:
	for x in GridSize:
		for y in GridSize:
			tile_dict[str(Vector2i(x, y))] ={
				"Type": "Grass",
				#"Type": "Straight Path",
				#"Type": "Curved Path",
				#"Type": "Dead End"
			}
			tile_map_layer.set_cell(Vector2i(x, y), 0, Vector2i(0, 0), 0)

func _on_rotate_clockwise_pressed() -> void:
	rotate_tile("cw")


func _on_rotate_counterclockwise_pressed() -> void:
	rotate_tile("ccw")


func rotate_tile(dir):
	# update the direction vector
	if dir == "cw":
		tile_direction = Vector2i(tile_direction[1] * -1, tile_direction[0])
	else:
		tile_direction = Vector2i(tile_direction[1], tile_direction[0] * -1)
	get_applied_transform()
	redraw_tiles()


func get_applied_transform():
	# then reset the applied transform and work out the new one based on rotation and mirror
	applied_transform = 0
	for i in tile_transforms[tile_direction]:
		applied_transform += i


func redraw_tiles():
	for x in GridSize:
		for y in GridSize:
			tile_map_layer.set_cell(Vector2i(x, y), 0, Vector2i(0, 0), applied_transform)


func _on_apply_pressed() -> void:
	pass # Replace with function body.
