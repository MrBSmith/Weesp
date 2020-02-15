extends ElementStateMachineBase

var collision_shape_node : Node
export var elem_mass : float = 5.0

#### WATER STATE ####

# Apply gravity to the player if he is in water
func update(_host, delta):
	if player_node.is_in_water() or !player_node.is_on_floor():
		# Get inputs from the player, and deduce it a direction
		physics_node.direction = get_input_axis()
		
		if player_node.is_in_water():
			physics_node.mass = 0.0
		else:
			physics_node.mass = elem_mass
	
	# Manage the state changing
	if current_state == null:
		return
	state_name = current_state.update(self, delta)
	if state_name:
		set_state(get_node(state_name))


# Returns the direction the player is trying to go 
func get_input_axis():
	var axis = Vector2.ZERO
	axis.x = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	axis.y = int(Input.is_action_pressed("move_down")) - int(Input.is_action_pressed("move_up"))
	
	return axis.normalized()


# Apply the mass of the
func enter_state(_host):
	if current_state == null:
		set_state(states_map[0])
	sprite_node.set_visible(true)
	current_state.enter_state(self)
	physics_node.floating = false
	physics_node.mass = elem_mass

