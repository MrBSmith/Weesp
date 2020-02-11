extends StateBase

class_name BaseMove

var physics_node : Node

func update(_host, _delta):
	if physics_node.velocity == Vector2.ZERO:
		return "Idle"

func enter_state(_host):
	pass

func exit_state(_host):
	pass
