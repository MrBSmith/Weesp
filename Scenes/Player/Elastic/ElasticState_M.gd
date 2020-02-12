extends ElementStateMachineBase

#### ELASTIC STATE ####

onready var state_node_array = get_children()

func setup():
	for state in state_node_array:
		if "physics_node" in state:
			state.physics_node = physics_node

func enter_state(_host):
	sprite_node.set_visible(true)
	physics_node.direction = Vector2.ZERO
	
	if player_node.is_on_wall():
		set_state("Glue")
	else:
		set_state("Fall")


