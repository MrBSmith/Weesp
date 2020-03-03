extends Camera2D

var player_node : Node

var pointing_direction : Vector2 = Vector2.ZERO
var rotation_target : int = 0
var is_rotating : bool = false

signal camera_rotated

func _ready():
	set_physics_process(false)

func setup():
	var _err = connect("camera_rotated", player_node, "on_camera_rotated")


# Triggers the rotation on input of the player
func _input(event):
	if player_node.get_state() == "Leaf":
		if event.is_action_pressed("cam_cw") && is_rotating == false:
			rotation_target += 90
			
			is_rotating = true
			if rotation_target >= 360:
				rotation_target = 0
			set_physics_process(true)
		
		if event.is_action_pressed("cam_ccw") && is_rotating == false:
			rotation_target -= 90
			
			is_rotating = true
			if rotation_target < 0:
				rotation_target = 270
			set_physics_process(true)


# Handle the rotation movement
func _physics_process(_delta):
	
	if rotation_target == 270 && rotation_degrees == 0:
		rotation_degrees = 360
	
	# Handle the rotaion itself
	if rotation_target != 0:
		rotation_degrees += (rotation_target - rotation_degrees) / 4
	elif rotation_degrees <= 90:
		rotation_degrees -= rotation_degrees / 4
	else:
		rotation_degrees += (360 - rotation_degrees) / 4
	
	# Check if the rotation is over
	if (rotation_degrees >= rotation_target - 1 && rotation_degrees <= rotation_target + 1) or rotation_degrees >= 359:
		rotation_degrees = rotation_target
		is_rotating = false
		set_physics_process(false)
		
		# Notify the player the camera turned
		emit_signal("camera_rotated")
