extends ElementStateMachineBase

export var elem_mass : float = 1.0

#### LEAF STATE ####

func update(_host, _delta):
	if player_node.is_in_water():
		physics_node.floating = true
	else:
		physics_node.floating = false

func enter_state(_host):
	sprite_node.set_visible(true)
	current_state.enter_state(self)
	
	physics_node.mass = elem_mass
	physics_node.floating = true
	physics_node.direction = Vector2.ZERO
