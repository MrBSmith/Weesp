extends Node2D

onready var children_nodes_array = get_children()
onready var camera_node = get_node("Camera2D")
onready var player_node = get_node("Player")

var level1 := load("res://Scenes/Level/Level.tscn")
var level2 := load("res://Scenes/Level/Level2.tscn")
var level3 := load("res://Scenes/Level/Level3.tscn")
var level4 := load("res://Scenes/Level/Level4.tscn")

var level_list : Array = [level1, level2, level3, level4]
var current_level_index : int = -1
var current_level : Node = null
var starting_point_pos := Vector2.ZERO


func _ready():
	for child in children_nodes_array:
		if "camera_node" in child:
			child.camera_node = camera_node
			
		if "player_node" in child:
			child.player_node = player_node
		
		if child.has_method("setup"):
			child.setup()


# Queue free the current level and add the next
func next_level():
	# Change the level to be the next one
	if current_level != null:
		current_level.queue_free()
	current_level_index += 1
	current_level = level_list[current_level_index].instance()
	add_child(current_level)
	
	# Get the starting point of the level, and set the player's position to it
	starting_point_pos = current_level.get_node("StartingPoint").get_global_position()
	player_node.set_global_position(starting_point_pos)