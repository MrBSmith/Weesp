extends BaseIdle

var sprite_node : Node

#### LEAF IDLE ####

func update(_host, _delta):
	if !player_node.is_on_wall():
		return "Fall"


func enter_state(_host):
	sprite_node._set_playing(false)
