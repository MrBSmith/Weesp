extends Node

class_name StateMachineBase

# Define the list of possible states, and give the path to the corresponding node for each state
# The states are distinguished by the name of their corresponding node
# The default state is always the first in the tree

onready var states_map = get_children()

onready var current_state : Object
onready var previous_state : Object

var state_name

signal state_changed

func setup():
	set_state(states_map[0])


# Call for the current state process at every frame of the physic process
func _physics_process(delta):
	if current_state == null:
		return
	state_name = current_state.update(self, delta)
	if state_name:
		set_state(get_node(state_name))


# Set current_state at a new state, also set previous state, and emit a signal to notify the change, to anybody needing it 
func set_state(new_state):
	
	# if the given argument is a string, get the 
	if new_state is String:
		new_state = get_node(new_state)
	
	# Discard the method if the new_state is the current_state
	if new_state == current_state:
		return
	
	# Use the exit state function of the current state
	if current_state != null:
		current_state.exit_state(self)
	
	# Change the current state, and the previous state
	previous_state = current_state
	current_state = new_state
	
	state_name = current_state.get_name()
	
	# Use the enter_state function of the current state
	if new_state != null:
		current_state.enter_state(self)
	
	emit_signal("state_changed", state_name)

# Returns the current state
func get_state() -> Object:
	return current_state
