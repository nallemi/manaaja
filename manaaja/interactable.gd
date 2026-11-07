class_name Interactable
extends Area2D

signal interacted
signal action_request

## saadaan tieto onko esinettä klikattu ja lähetetään tieto eteenpäin huoneelle.
func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed == true:
			interacted.emit(self)

## palaa tieto että jotain voi tapahtua
func _on_interacted(target) -> void:
	print("clicked ", target.name)


func interact():
	print("done", self.name)
	action_request.emit(self.name)
