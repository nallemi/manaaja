extends Node2D
@export var starting_room: PackedScene
@export var test_room: PackedScene
var current_room: Node2D

## pelaajalle paikka ja kohde klikatessa jotain esinettä
func _on_room_interaction(target: Variant, target_position: Variant) -> void:
	$Player.target_position = target_position
	$Player.interaction_target = target

## huoneen vaihtaminen pelin sisällä
func _on_room_exit(new_room, new_door):
	change_room(load(new_room))
	$Player._teleport(current_room.get_node(new_door).get_node("Marker2D").global_position)


## huoneen lisääminen ja edellisen huoneen poisto rosterista ja interaktioiden seuraaminen.
func change_room(new_room: PackedScene):
	if current_room != null:
		current_room.queue_free()
	current_room = new_room.instantiate()
	add_child(current_room)
	current_room.interaction.connect(_on_room_interaction)
	current_room.enter_room.connect(_on_room_exit)

## ladataan alkuhuone
func _ready():
	change_room(starting_room)
	
## testaus huoneen vaihtamisesta.
func _input(event):
	if event is InputEventKey:
		if event.keycode == KEY_1 and event.pressed:
			change_room(test_room)
		if event.keycode == KEY_2 and event.pressed:
			change_room(starting_room)
