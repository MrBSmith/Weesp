extends BaseIdle

#### GLUE STATE ####

const IMPULSE_FORCE : int = 1500

var mouse_relative_pos := Vector2.ZERO

onready var arrow_sprite_node = get_node("Arrow")
onready var children_array = get_children()

func setup():
	for child in children_array:
		if "player_node" in child:
			child.player_node = player_node


# Make the arrow turn towards the destination
func update(_host, _delta):
	var mouse_pos = get_viewport().get_mouse_position()
	var player_pos = player_node.get_position()
	mouse_relative_pos = player_pos - mouse_pos
	
	var angle_to_dest = mouse_relative_pos.angle()
	arrow_sprite_node.set_rotation(angle_to_dest)
	
	if !player_node.is_on_wall():
		return "Fall"


# Apply the impulsion when the player click
func _input(event):
	if event is InputEventMouseButton && element_state_node.get_state() == self:
		if event.button_index == BUTTON_LEFT && event.is_pressed():
			physics_node.velocity = -mouse_relative_pos.normalized() * IMPULSE_FORCE
			physics_node.set_physics_process(true)



func enter_state(_host):
	physics_node.set_physics_process(false)
	arrow_sprite_node.set_visible(true)


func exit_state(_host):
	physics_node.set_physics_process(true)
	arrow_sprite_node.set_visible(false)

