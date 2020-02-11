extends ElementStateMachineBase

#### WATER STATE ####

func enter_state(_host):
    physics_node.gravity_modifier = 0

func exit_state(_host):
	pass
