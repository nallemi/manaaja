extends CharacterBody2D

var target_position = Vector2.ZERO
var interaction_target = null
var vector = Vector2.ZERO



func _ready():
	target_position = global_position
	
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed == true:
			interaction_target = null
			target_position = get_global_mouse_position()

func _physics_process(_delta):
	if global_position.distance_to(target_position) < 10:	
		velocity = Vector2.ZERO
		if interaction_target != null:
			interaction_target.interact()
			interaction_target = null
	else: 
		vector = global_position.direction_to(target_position)
		velocity = vector * 100
	move_and_slide()
