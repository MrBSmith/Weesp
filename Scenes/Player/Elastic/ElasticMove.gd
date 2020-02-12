extends BaseMove

#### JUMP STATE ####

export var elem_mass : float = 5.0

func enter_state(_host):
	physics_node.mass = elem_mass
