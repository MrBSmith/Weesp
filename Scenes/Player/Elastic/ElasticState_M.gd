extends ElementStateMachineBase

#### ELASTIC STATE ####

func enter_state(_host):
	if current_state == null:
		set_state(states_map[0])
		
	sprite_node.set_visible(true)
	physics_node.direction = Vector2.ZERO
	
	if player_node.is_on_wall():
		set_state("Glue")
	else:
		set_state("Fall")
	
	current_state.enter_state(self)
