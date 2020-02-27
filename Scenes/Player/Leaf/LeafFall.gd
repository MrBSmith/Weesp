extends StateBase

#### LEAF FALL ####

onready var particule_node := get_node("Particles2D")

var physics_node : Node
var sprite_node : Node

func update(_host, _delta):
	physics_node.direction = get_input_axis()

	if player_node.is_on_wall():
		return "Idle"


# Returns the direction the player is trying to go 
func get_input_axis():
	var axis = Vector2.ZERO
	axis.x = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	
	return axis.normalized()


func enter_state(_host):
	sprite_node._set_playing(true)
	particule_node.set_emitting(true)


func exit_state(_host):
	sprite_node._set_playing(false)
	particule_node.set_emitting(false)
