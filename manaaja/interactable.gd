class_name Interactable
extends Area2D

signal interacted

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed == true:
			interacted.emit(self)

func interact():
	print(self.name)


func _on_interacted(target) -> void:
	print(target.name)
