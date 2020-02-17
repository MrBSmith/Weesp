extends ElementStateMachineBase

#### ELASTIC STATE ####

var camera_node

onready var glue_state_node = get_node("Glue")

func setup():
	for state in states_map:
		if "player_node" in state:
			state.player_node = player_node
		
		if "physics_node" in state:
			state.physics_node = physics_node
		
		if "element_state_node" in state:
			state.element_state_node = self
		
		if "state_machine_node" in state:
			state.state_machine_node = state_machine_node
		
		if "camera_node" in state:
			state.camera_node = camera_node
		
		if state.has_method("setup"):
			state.setup()


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
