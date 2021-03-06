extends Node

var player_node : Node
var state_machine_node : Node

const MAX_SPEED : int = 300
const DAMP : int = 1300
const ACCELERATION : int = 2000

var speed_modifier : float = 1.0 
var gravity := Vector2(0, 10)
var velocity := Vector2.ZERO
var direction := Vector2.ZERO
var wind_force := Vector2.ZERO
var mass : int = 5
var floating := false
var total_rotation_rad : float


# Rotate the gravity accordingly to the camera rotation
func rotate_physics(clockwise : bool):
	
	# Keep trace of the total rotation of the camera
	if clockwise:
		total_rotation_rad += 0.5
		gravity = gravity.rotated(PI * 0.5) # Rotate the gravity by 90°
	else:
		total_rotation_rad -= 0.5
		gravity = gravity.rotated(-PI * 0.5) # Rotate the gravity by 90°
		
	if total_rotation_rad >= 2.0:
		total_rotation_rad = 0.0
	elif total_rotation_rad < 0.0:
		total_rotation_rad = 1.5


# Reset the physics to its original state
func reset_physics():
	total_rotation_rad = 0.0
	gravity = Vector2(0, 10)
	velocity = Vector2.ZERO
	direction = Vector2.ZERO
	wind_force = Vector2.ZERO


# Apply a force whenever this function is called
func apply_force(force: Vector2):
	wind_force += force


func _physics_process(delta):
	# Apply movement/damp
	var rot_dir = direction.rotated(PI * total_rotation_rad)
	var total_movement = rot_dir + (wind_force * int(state_machine_node.get_state().name == "Leaf"))
	
	if total_movement == Vector2.ZERO:
		apply_friction(DAMP * delta)
	else: 
		apply_movement(total_movement * ACCELERATION * delta)
	
	# Calculate the gravity
	var applied_gravity := gravity * mass
	
	# Apply gravity
	if floating:
		velocity -= applied_gravity
	else:
		velocity += applied_gravity
	
	
	# Move the player
	var _err = player_node.move_and_slide(velocity)

func invert_x_velocity():
	velocity.x = -velocity.x


func invert_y_velocity():
	velocity.y = -velocity.y

# Apply friction, progressively stop movement
func apply_friction(value : float):
	if velocity.length() > value:
		velocity -= velocity.normalized() * value
	else:
		velocity = Vector2.ZERO


# Apply the movement of the player
func apply_movement(value : Vector2):
	velocity += value
	velocity = velocity.clamped(MAX_SPEED * speed_modifier)
