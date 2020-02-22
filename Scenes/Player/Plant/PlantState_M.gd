extends ElementStateMachineBase

export var elem_mass : float = 2.2
export var speed_modifier : float = 0.18

#### LEAF STATE ####

func update(_host, delta):
	# Manage the floating
	if player_node.is_in_water():
		physics_node.floating = true
	else:
		physics_node.floating = false
	
	# Manage the sub state changement
	if current_state == null:
		return
	state_name = current_state.update(self, delta)
	if state_name:
		set_state(get_node(state_name))


# Give to the player the physics properties of the leaf state
func enter_state(_host):
	if current_state == null:
		set_state(states_map[0])
		
	sprite_node.set_visible(true)
	current_state.enter_state(self)
	
	physics_node.mass = elem_mass
	physics_node.floating = true
	physics_node.direction = Vector2.ZERO
	physics_node.speed_modifier = speed_modifier


func exit_state(_host):
	# Triggers the sub state exit_state method
	for state in state_node_array:
		if state.has_method("exit_state"):
			state.exit_state(self)
	
	# Set the sprite to invisible
	sprite_node.set_visible(false)
	
	# Reset the speed to normal
	physics_node.speed_modifier = 1.0
