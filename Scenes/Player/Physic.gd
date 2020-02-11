extends Node

var player_node : Node

signal gravity_modifier_changed

const MAX_SPEED : int = 300
const GRAVITY : int = 50
const DAMP : int = 1300
const ACCELERATION : int = 2000

var velocity := Vector2.ZERO
var direction := Vector2.ZERO
var gravity_modifier : float = 1.0 setget set_gravity_modifier
var floating := false


func set_gravity_modifier(value : float):
	gravity_modifier = value
	emit_signal("gravity_modifier_changed", gravity_modifier)


func _physics_process(delta):
	# Apply gravity
	velocity.y += (GRAVITY * gravity_modifier) * int(!floating)
	
	if direction == Vector2.ZERO:
		apply_friction(DAMP * delta)
	else:
		apply_movement(direction * ACCELERATION * delta)
	
	# Move the player
	var _err = player_node.move_and_slide(velocity)

# Apply friction, progressively stop movement
func apply_friction(value : float):
	if velocity.length() > value:
		velocity -= velocity.normalized() * value
	else:
		velocity = Vector2.ZERO


func apply_movement(value : Vector2):
	velocity += value
	velocity = velocity.clamped(MAX_SPEED)

