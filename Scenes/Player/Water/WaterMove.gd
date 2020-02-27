extends BaseMove

#### WATER MOVE ####

onready var particules_node = get_node("Particles2D")

var element_state_node : Node
var state_machine_node : Node

func update(_host, _delta):
	if abs(physics_node.velocity.x) < 10 or abs(physics_node.velocity.y) < 10:
		return "Idle"


func enter_state(_host):
	particules_node.set_emitting(true)


func exit_state(_host):
	particules_node.set_emitting(false)
