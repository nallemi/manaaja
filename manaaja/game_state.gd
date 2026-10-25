extends Node

var item_states = {"Bookcase": "full", "flies" : "safe"}
var narration_data = {}

func get_narration(item):
	print("narration", item)
	var item_state = item_states[item]
	manage_interactable_state(item)

	return(narration_data[item][item_state].pick_random())

func load_narration():
	var file = FileAccess.open("res://narrations.json", FileAccess.READ)
	narration_data = JSON.parse_string(file.get_as_text())

	
func change_state(item, new_state):
	item_states[item] = new_state
	
func manage_interactable_state(item):
	if item == "Bookcase" and item_states[item] == "full":
		change_state(item, "empty")
	if item == "flies" and item_states["Bookcase"] == "empty" and item_states[item] == "safe":
		change_state(item, "kill")


func _ready():
	load_narration()
