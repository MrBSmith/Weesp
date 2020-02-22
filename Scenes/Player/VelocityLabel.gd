extends Label

var physics_node : Node

func _physics_process(_delta):
	text = "x " + String(int(physics_node.velocity.x)) + ", " + String(int(physics_node.velocity.y))
