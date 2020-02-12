extends Label

var state_machine_node : Node

func setup():
	var _err = state_machine_node.connect("state_changed", self, "on_state_changed")
	text = "Element State: " + state_machine_node.get_state().name

func on_state_changed(state_name):
	if state_name != null:
		text = "Element State: " + state_name
