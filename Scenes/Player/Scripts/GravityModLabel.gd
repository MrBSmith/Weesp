extends Label

var player_node : Node
var physics_node : Node

func setup():
	var _err = physics_node.connect("gravity_modifier_changed", self, "on_gravity_modifier_changed")

func on_gravity_modifier_changed(grav_mod):
	text = "Gavity Modifier: " + grav_mod as String
