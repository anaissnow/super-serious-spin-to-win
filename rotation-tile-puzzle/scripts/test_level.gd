extends Node

@onready var grass: TextureRect = $MarginContainer/HBoxContainer/GridContainer/Grass
@onready var dead_end: TextureRect = $MarginContainer/HBoxContainer/GridContainer/DeadEnd
@onready var curved_path: TextureRect = $MarginContainer/HBoxContainer/GridContainer/CurvedPath
@onready var straight_path: TextureRect = $MarginContainer/HBoxContainer/GridContainer/StraightPath


func _on_rotate_clockwise_pressed() -> void:
	if straight_path.position.x == 0:
		if straight_path.has_method("rotate_ninety"):
			straight_path.rotate_ninety()
	else:
		if straight_path.has_method("rotate_zero"):
			straight_path.rotate_zero()


func _on_rotate_counterclockwise_pressed() -> void:
	pass # Replace with function body.


func _on_apply_pressed() -> void:
	pass # Replace with function body.
