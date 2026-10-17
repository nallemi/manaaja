extends Interactable

@export_file("*.tscn") var target_room: String
@export var target_door: String

signal exit_to(target_room, target_door)

## ovelle oma interact toiminto ilmoittaa mihin huoneeseen ja oveen se yhdistyy
func interact():
	exit_to.emit(target_room, target_door)
