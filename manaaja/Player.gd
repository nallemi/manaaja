extends CharacterBody2D

var target_position = Vector2.ZERO
var vector = Vector2.ZERO

func _ready():
	target_position = global_position
	
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed == true:
			target_position = get_global_mouse_position()
			

func _physics_process(_delta):

	if global_position.distance_to(target_position) > 10:	
		vector = global_position.direction_to(target_position)
		velocity = vector * 100


	else: 
		velocity = Vector2.ZERO
	move_and_slide()
