extends Node2D

signal interaction(target, target_position)
signal enter_room(target_room, target_door)
signal room_action_request(item)

## Lähetetään worldille tietoa siitä että jotain huoneen esinettä on klikattu
func _on_interacted(target) -> void:
	interaction.emit(target, target.get_node("Marker2D").global_position)

## lähetetään tieto worldille että nyt huoneesta lähdetään pois

func _on_exit_to(target_room: Variant, target_door: Variant) -> void:
	enter_room.emit(target_room, target_door)

## lähetetään tieto worldille että nyt pitäisi tapahtua jotain
func _on_action_request(item):
	print("huone kertoo action request", item)
	room_action_request.emit(item)
