extends StateMachineBase

class_name ElementStateMachineBase

onready var sprite_node = get_node("Sprite")
onready var state_node_array = get_children()

var player_node : Node
var physics_node : Node
var state_machine_node : Node

func _ready():
	set_physics_process(false)

func setup():
	for state in states_map:
		if "player_node" in state:
			state.player_node = player_node
		
		if "physics_node" in state:
			state.physics_node = physics_node
		
		if "element_state_node" in state:
			state.element_state_node = self
		
		if "state_machine_node" in state:
			state.state_machine_node = state_machine_node
		
		if state.has_method("setup"):
			state.setup()

# Call for the current state process at every frame of the physic process
func update(_host, delta):
	if current_state == null:
		return
	state_name = current_state.update(self, delta)
	if state_name:
		set_state(get_node(state_name))


func enter_state(_host):
	if current_state == null:
		set_state(states_map[0])
	sprite_node.set_visible(true)
	current_state.enter_state(self)


func exit_state(_host):
	for state in state_node_array:
		if state.has_method("exit_state"):
			state.exit_state(self)
	
	sprite_node.set_visible(false)
