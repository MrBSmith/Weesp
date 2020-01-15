extends StateMachineBase

onready var player_node : Node
onready var children_array = get_children()

func state_init():
	for child in children_array:
		if ("player_node" in child):
			child.player_node = player_node