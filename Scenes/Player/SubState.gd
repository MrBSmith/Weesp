extends Label

var state_machine_node : Node

func _physics_process(_delta):
	text = "SubState: " + state_machine_node.get_state().get_state().name
