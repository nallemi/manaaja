extends Node2D
@export var starting_room: PackedScene
var current_room: Node2D

func _on_room_interaction(target: Variant, target_position: Variant) -> void:
	$Player.target_position = target_position
	$Player.interaction_target = target
	print(target)

func _ready():
	current_room = starting_room.instantiate()
	add_child(current_room)
