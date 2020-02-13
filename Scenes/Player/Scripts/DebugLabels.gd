extends Node

onready var children_node_array = get_children()

var player_node : Node
var physics_node : Node
var state_machine_node : Node

func setup():
	for child in children_node_array:
		if "player_node" in child:
			child.player_node = player_node
		
		if "physics_node" in child:
			child.physics_node = physics_node
		
		if "state_machine_node" in child:
			child.state_machine_node = state_machine_node
		
		if child.has_method("setup"):
			child.setup()
