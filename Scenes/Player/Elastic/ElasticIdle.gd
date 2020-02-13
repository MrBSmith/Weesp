extends BaseIdle
#### GLUE STATE ####

onready var arrow_sprite_node = get_node("Arrow")
onready var children_array = get_children()

func setup():
	for child in children_array:
		if "player_node" in child:
			child.player_node = player_node


func enter_state(_host):
	physics_node.mass = 0.0
	arrow_sprite_node.set_activate(true)


func exit_state(_host):
	arrow_sprite_node.set_activate(false)

