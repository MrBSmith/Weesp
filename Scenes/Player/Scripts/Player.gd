extends KinematicBody2D

class_name Player

signal in_water_changed

#Define an array of all children of player
onready var children_array = get_children()
onready var state_machine_node = get_node("StateMachine")
onready var physics_node = get_node("Physics")
onready var collision_shape_node = get_node("CollisionShape2D")

const GRAVITY := 200.0
var dir_gravity := Vector2(0,1)

export var speed : float
var gap := Vector2(0,0)

var in_water : bool = false setget set_in_water, is_in_water

func is_class(value : String):
	return value == "Player" 


func set_in_water(value: bool):
	in_water = value
	emit_signal("in_water_changed", in_water)


func is_in_water() -> bool:
	return in_water


func on_camera_rotated():
	physics_node.rotate_physics()


# Give references to the children and setup them
func _ready():
	for child in children_array:
		if "player_node" in child:
			child.player_node = self
		
		if "physics_node" in child:
			child.physics_node = physics_node
		
		if "state_machine_node" in child:
			child.state_machine_node = state_machine_node
		
		if child.has_method("setup"):
			child.setup()
	
	set_in_water(true)
