extends StateMachineBase

onready var player_node : Node
onready var children_array = get_children()

func state_init():
	for child in children_array:
		if ("player_node" in child):
			child.player_node = player_node
			child.element_state_init()

func _unhandled_input(_event):
	if Input.is_action_just_pressed("SwitchWaterState"):
		set_state("WaterState_M")
	elif Input.is_action_just_pressed("SwitchLightningState"):
		set_state("LightningState_M")
	elif Input.is_action_just_pressed("SwitchElasticState"):
		set_state("ElasticState_M")