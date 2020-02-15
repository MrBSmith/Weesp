extends Label

var player_node : Node

func setup():
	var _err = player_node.connect("in_water_changed", self, "on_in_water_changed")

func on_in_water_changed(in_water):
	text = "In water: " + in_water as String
