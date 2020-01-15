extends StateBase

class_name BaseIdle

func update(_host, _delta):
	if(player_node.dest != Vector2(0,0)):
		return "Move"

func enter_state(_host):
	pass

func exit_state(_host):
	pass

func _input(event):
	#Mouse in viewport c oordinates
	if event is InputEventMouseButton:
		if (event.is_pressed() and event.button_index == BUTTON_LEFT):
			print("Character moved towards position: ", event.position)
			player_node.dest = event.position