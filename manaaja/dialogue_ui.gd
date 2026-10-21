extends CanvasLayer


func show_text(message: String):
	$PanelContainer/RichTextLabel.text = message
	visible = true
	
func hide_text():
	visible = false
	
func _input(event):
	if event is InputEventMouseButton and visible == true:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed == true:
			hide_text()
			get_viewport().set_input_as_handled()
