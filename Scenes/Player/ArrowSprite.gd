extends Sprite

var player_node : Node
var mouse_relative_pos := Vector2.ZERO


func _ready():
	set_physics_process(false)


func _physics_process(_delta):
	var mouse_pos = get_viewport().get_mouse_position()
	var player_pos = player_node.get_position()
	mouse_relative_pos = player_pos - mouse_pos
	
	var angle_to_dest = mouse_relative_pos.angle()
	set_rotation(angle_to_dest)


# Called when one wants to activate/desactivate the arrow
func set_activate(value: bool):
	set_physics_process(value)
	set_visible(value)
