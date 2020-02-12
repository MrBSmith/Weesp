extends Label

var state_machine_node : Node

func setup():
	var _err = state_machine_node.connect("state_changed", self, "on_state_changed")
	text = "SubState: " + state_machine_node.get_state().get_state().name

func on_state_changed(substate_name):
	text = "SubState: " + substate_name
