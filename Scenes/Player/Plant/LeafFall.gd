extends StateBase

var physics_node : Node

func update(_host, _delta):
	physics_node.direction = get_input_axis()

	if player_node.is_on_wall():
		return "Idle"


# Returns the direction the player is trying to go 
func get_input_axis():
	var axis = Vector2.ZERO
	axis.x = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	
	return axis.normalized()
