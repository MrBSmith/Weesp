extends BaseIdle

#### WATER IDLE ####

func update(_host, _delta):
	if physics_node.velocity != Vector2.ZERO:
		return "Move"
