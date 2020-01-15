extends StateMachineBase

class_name ElementStateMachineBase

func _ready():
	set_physics_process(false)

# Call for the current state process at every frame of the physic process
func update(_host, delta):
	if current_state == null:
		return
	state_name = current_state.update(self, delta)
	if state_name:
		set_state(get_node(state_name))

func enter_state(_host):
	pass

func exit_state(_host):
	pass