extends Node2D


onready var children_nodes_array = get_children()

onready var player_node = get_node("Player")
onready var camera_node = get_node("Camera2D")

func _ready():
	for child in children_nodes_array:
		if "camera_node" in child:
			child.camera_node = camera_node
			
		if "player_node" in child:
			child.player_node = player_node
		
		if child.has_method("setup"):
			child.setup()
		
