extends Node2D

export var player_possible_states : PoolStringArray

onready var children_node_array = get_children()

func _ready():
	for node in children_node_array:
		if "level_node" in node:
			node.level_node = self
		
		if node.has_method("setup"):
			node.setup()
