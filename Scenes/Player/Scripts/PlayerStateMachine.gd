extends StateMachineBase

var player_node : Node
var physics_node : Node
var camera_node : Node

onready var children_array = get_children()

func setup():
	for child in children_array:
		if "player_node" in child:
			child.player_node = player_node
	
		if "physics_node" in child:
			child.physics_node = physics_node
		
		if "state_machine_node" in child:
			child.state_machine_node = self
		
		if "camera_node" in child:
			child.camera_node = camera_node
		
		if child.has_method("setup"):
			child.setup()
	
	# Set the start state to be the first state in the list
	set_state(states_map[0])

# Handle the element state change
func _unhandled_input(_event):
	if Input.is_action_just_pressed("SwitchWaterState"):
		set_state("Water")
	elif Input.is_action_just_pressed("SwitchPlantState"):
		set_state("Leaf")
	elif Input.is_action_just_pressed("SwitchElasticState"):
		set_state("Elastic")
