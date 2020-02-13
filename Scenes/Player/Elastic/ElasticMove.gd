extends BaseMove

#### JUMP STATE ####

export var elem_mass : float = 5.0

func update(_host, _delta):
	if player_node.is_on_wall():
		return "Glue"


func enter_state(_host):
	if !player_node.is_on_wall():
		physics_node.set_physics_process(true)
		physics_node.mass = elem_mass
