extends Area2D

class_name Water
const CLASS_NAME = "Water"

onready var floating_line_node = get_node("FloatingLine")
onready var water_area = get_node_or_null("CollisionShape2D")
onready var particules_node = get_node("Particles2D")

var M_IceBlocks_node : Node2D

func _ready():
	var _err
	_err = connect("body_entered", self, "on_body_entered")
	_err = connect("body_exited", self, "on_body_exited")


# Return true is the given string is the name of the class 
# (Necesary in 3.2 because Godot check the very parent class instead of the current class)
func is_class(value : String):
	return value == CLASS_NAME


# Return a string of the name of the class 
# (Necesary in 3.2 because Godot check the very parent class instead of the current class)
func get_class():
	return CLASS_NAME


# Notify the player that he is in water
func on_body_entered(body):
	if body.is_class("Player"):
		body.set_in_water(true)


# Notify the player that he is not in water
func on_body_exited(body):
	if body.is_class("Player"):
		body.set_in_water(false)

# Return true if the given position is inside the given area, false if not
func is_position_in_area(pos: Vector2, collision_shape : CollisionShape2D) -> bool:
	var shape_pos = collision_shape.get_global_position()
	var shape_ext = collision_shape.get_shape().get_extents()
	
	return pos.y > shape_pos.y - shape_ext.y && pos.y < shape_pos.y + shape_ext.y && pos.x > shape_pos.x - shape_ext.x && pos.x < shape_pos.x + shape_ext.x


# Setup the floating on the given body
func body_floating(body : PhysicsBody2D, float_or_not : bool):
	body.is_floating = float_or_not
	
	if float_or_not == true:
		body.floating_line_y = floating_line_node.global_position.y
