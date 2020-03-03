extends KinematicBody2D

class_name Player

signal in_water_changed
signal death

# Define an array of all children of player
onready var children_array = get_children()
onready var state_machine_node = get_node("StateMachine")
onready var physics_node = get_node("Physics")
onready var collision_shape_node = get_node("CollisionShape2D")
onready var leaf_sprite_node = get_node("StateMachine/Leaf/Sprite")
onready var debug_labels_node = get_node("Debug/DebugLabels")

var game_node : Node
var camera_node : Camera2D

export var speed : float
var gap := Vector2(0,0)

var in_water : bool = false setget set_in_water, is_in_water
var camera_rotate_able : bool = true

func is_class(value : String):
	return value == "Player" 


# Give references to the children and setup them
func setup():
	var _err = connect("death", game_node, "restart_level")
	
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


func death():
	emit_signal("death")


# Give to physics node the force it get from elsewhere
func apply_force(force: Vector2):
	physics_node.apply_force(force)


func set_in_water(value: bool):
	in_water = value
	emit_signal("in_water_changed", in_water)
	if get_state() == "Water":
		camera_rotate_able = true


func is_in_water() -> bool:
	return in_water


func on_camera_rotated(clockwise : bool):
	physics_node.rotate_physics(clockwise)
	
	if clockwise:
		leaf_sprite_node.rotation_degrees += 90
	else:
		leaf_sprite_node.rotation_degrees -= 90
	
	if leaf_sprite_node.rotation_degrees >= 360:
		leaf_sprite_node.rotation_degrees = 0
	elif leaf_sprite_node.rotation_degrees < 0:
		leaf_sprite_node.rotation_degrees = 270


func reset_physics():
	physics_node.reset_physics()
	leaf_sprite_node.rotation_degrees = 0


func set_velocity(value : Vector2):
	physics_node.velocity = value


func set_state(value : String):
	state_machine_node.set_state(value)


func get_state() -> String:
	return state_machine_node.get_state().name


func _input(_event):
	if Input.is_action_pressed("ui_cancel"):
		debug_labels_node.set_visible(!debug_labels_node.is_visible())
