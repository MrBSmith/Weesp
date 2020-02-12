extends Node

var player_node : Node

const MAX_SPEED : int = 300
const GRAVITY : int = 10
const DAMP : int = 1300
const ACCELERATION : int = 2000

var velocity := Vector2.ZERO
var direction := Vector2.ZERO
var mass : int = 5
var floating := false


func _physics_process(delta):
	
	# Apply movement/damp
	if direction == Vector2.ZERO:
		apply_friction(DAMP * delta)
	else: 
		apply_movement(direction * ACCELERATION * delta)
	
	# Calculate the gravity
	var applied_gravity = GRAVITY * mass
	
	# Apply gravity
	if floating:
		velocity.y -= applied_gravity
	else:
		velocity.y += applied_gravity
	
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

