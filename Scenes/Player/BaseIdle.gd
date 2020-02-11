extends StateBase

class_name BaseIdle

var state_machine_node : Node
var element_state_node : Node
var physics_node : Node

func update(_host, _delta):
	if physics_node.destination != Vector2(0,0):
		return "Move"

func enter_state(_host):
	pass

func exit_state(_host):
	pass
