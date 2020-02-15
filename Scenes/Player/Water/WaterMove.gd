extends BaseMove

#### WATER MOVE ####

var element_state_node : Node
var state_machine_node : Node

func update(_host, _delta):
	if physics_node.velocity == Vector2.ZERO:
		return "Idle"
