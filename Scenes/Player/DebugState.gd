extends Label

onready var state_machine_node = get_parent()

func _ready():
	var _err = state_machine_node.connect("state_changed", self, "on_state_changed")

func on_state_changed(state_name):
	if(state_name != null):
		text = state_name