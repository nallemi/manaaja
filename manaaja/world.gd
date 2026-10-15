extends Node2D

func _on_room_interaction(target: Variant, target_position: Variant) -> void:
	$Player.target_position = target_position
	$Player.interaction_target = target
	print(target)
