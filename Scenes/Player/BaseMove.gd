extends StateBase

onready var player_node# = get_parent().get_parent()

func update(_host, delta):
	player_node.player_click_movement(delta)
	if(player_node.position == player_node.dest):
		return "BaseIdle"
	
func enter_state(_host):
	print("MOVE STATE ENTERED")

func exit_state(_host):
	player_node.dest = Vector2(0,0)
	print("MOVE STATE EXITED")