extends KinematicBody2D

class_name Player

signal in_water_changed

# Define an array of all children of player
onready var children_array = get_children()
onready var state_machine_node = get_node("StateMachine")
onready var physics_node = get_node("Physics")
onready var collision_shape_node = get_node("CollisionShape2D")

var camera_node : Camera2D

export var speed : float
var gap := Vector2(0,0)

var in_water : bool = false setget set_in_water, is_in_water

func is_class(value : String):
	return value == "Player" 

# Give to physics node the force it get from elsewhere
func apply_force(force: Vector2):
	physics_node.apply_force(force)


func set_in_water(value: bool):
	in_water = value
	emit_signal("in_water_changed", in_water)


func is_in_water() -> bool:
	return in_water


func on_camera_rotated():
	physics_node.rotate_physics()


func set_velocity(value : Vector2):
	physics_node.velocity = value


func set_state(value : String):
	state_machine_node.set_state(value)


# Give references to the children and setup them
func setup():
	for child in children_array:
		if "player_node" in child:
			child.player_node = self
		
		if "physics_node" in child:
			child.physics_node = physics_node
		
		if "state_machine_node" in child:
			child.state_machine_node = state_machine_node
		
		if "camera_node" in child:
			child.camera_node = camera_node
		
		if child.has_method("setup"):
			child.setup()
	
	set_in_water(true)
