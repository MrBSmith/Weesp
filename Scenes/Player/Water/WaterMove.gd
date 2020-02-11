extends BaseMove

#### WATER MOVE ####

var element_state_node : Node
var state_machine_node : Node

# Give the player its destination
func _input(event):
	if element_state_node.get_state() == self && state_machine_node.get_state() == element_state_node:
		if event is InputEventMouseButton:
			if event.is_pressed() and event.button_index == BUTTON_LEFT:
				physics_node.destination = event.position
