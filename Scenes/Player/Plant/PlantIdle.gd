extends BaseIdle

func update(_host, _delta):
	if !player_node.is_on_wall():
		return "Fall"

func _ready():
	pass
