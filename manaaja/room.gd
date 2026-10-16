extends Node2D

signal interaction(target, target_position)

func _on_interactable_interacted(target) -> void:
	interaction.emit(target, target.get_node("Marker2D").global_position)
	print("Room vastaanotti: ", target.name)


func _on_interacted() -> void:
	pass # Replace with function body.
