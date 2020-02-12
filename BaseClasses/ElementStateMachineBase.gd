extends StateMachineBase

class_name ElementStateMachineBase

onready var sprite_node = get_node("Sprite")

var player_node : Node
var physics_node : Node
var state_machine_node : Node

func _ready():
	set_physics_process(false)

func setup():
	set_state(states_map[0])
	for state in states_map:
		if "player_node" in state:
			state.player_node = player_node
		
		if "physics_node" in state:
			state.physics_node = physics_node
		
		if "element_state_node" in state:
			state.element_state_node = self
		
		if "state_machine_node" in state:
			state.state_machine_node = state_machine_node

# Call for the current state process at every frame of the physic process
func update(_host, delta):
	if current_state == null:
		return
	state_name = current_state.update(self, delta)
	if state_name:
		set_state(get_node(state_name))

func enter_state(_host):
	sprite_node.set_visible(true)

func exit_state(_host):
	sprite_node.set_visible(false)
