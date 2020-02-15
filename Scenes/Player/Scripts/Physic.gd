extends Node

var player_node : Node

const MAX_SPEED : int = 300
const DAMP : int = 1300
const ACCELERATION : int = 2000

var gravity := Vector2(0, 10)
var velocity := Vector2.ZERO
var direction := Vector2.ZERO
var mass : int = 5
var floating := false
var total_rotation_rad : float

func rotate_physics():
	gravity = gravity.rotated(PI * 0.5) # Rotate the gravity by 90°
	
	# Keep trace of the total rotation of the camera
	total_rotation_rad += 0.5
	if total_rotation_rad >= 2.0:
		total_rotation_rad = 0.0


func _physics_process(delta):
	# Apply movement/damp
	if direction == Vector2.ZERO:
		apply_friction(DAMP * delta)
	else: 
		apply_movement(direction.rotated(PI * total_rotation_rad) * ACCELERATION * delta)
	
	# Calculate the gravity
	var applied_gravity := gravity * mass
	
	# Apply gravity
	if floating:
		velocity -= applied_gravity
	else:
		velocity += applied_gravity
	
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

