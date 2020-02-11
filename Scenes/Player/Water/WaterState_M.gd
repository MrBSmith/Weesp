extends ElementStateMachineBase

var collision_shape_node : Node
export var grav_mod : float = 0

#### WATER STATE ####

# Apply gravity to the player if he is in water
func update(host, delta):
	physics_node.floating = player_node.is_in_water()
	
	if host.get_state() == self:
		if player_node.is_in_water():
			physics_node.direction = get_input_axis()
	
	# Manage the state changing
	if current_state == null:
		return
	state_name = current_state.update(self, delta)
	if state_name:
		set_state(get_node(state_name))


func get_input_axis():
	var axis = Vector2.ZERO
	axis.x = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	axis.y = int(Input.is_action_pressed("move_down")) - int(Input.is_action_pressed("move_up"))
	
	return axis.normalized()


func is_a_direction_pressed():
	return Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right") or Input.is_action_pressed("move_up") or Input.is_action_pressed("move_down")

func enter_state(_host):
	pass


func exit_state(_host):
	physics_node.floating = false
