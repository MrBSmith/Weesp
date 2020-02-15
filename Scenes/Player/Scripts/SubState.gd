extends Label

var state_machine_node : Node

func setup():
	var states_array = state_machine_node.children_array
	for state in states_array:
		var _err = state.connect("state_changed", self, "on_state_changed")
	text = "SubState: " + state_machine_node.get_state().get_state().name


# Refresh the sub state each time this one changes
func on_state_changed(substate_name):
	text = "SubState: " + substate_name
