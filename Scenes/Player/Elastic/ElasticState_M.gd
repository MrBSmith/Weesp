extends ElementStateMachineBase

#### ELASTIC STATE ####

func setup():
	for state in state_node_array:
		if "physics_node" in state:
			state.physics_node = physics_node
		
		if "player_node" in state:
			state.player_node = player_node
		
		if state.has_method("setup"):
			state.setup()


func enter_state(_host):
	sprite_node.set_visible(true)
	physics_node.direction = Vector2.ZERO
	
	if player_node.is_on_wall():
		set_state("Glue")
	else:
		set_state("Fall")
	
	current_state.enter_state(self)
