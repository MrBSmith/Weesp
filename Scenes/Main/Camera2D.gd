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
	if event.is_action_pressed("ui_accept") && is_rotating == false:
		rotation_target += 90
		
		is_rotating = true
		if rotation_target >= 360:
			rotation_target = 0
		set_physics_process(true)


# Handle the rotation movement
func _physics_process(_delta):
	if rotation_target != 0:
		rotation_degrees += (rotation_target - rotation_degrees) / 4
	else:
		rotation_degrees += (360 - rotation_degrees) / 4
	
	if (rotation_degrees >= rotation_target - 1 && rotation_degrees <= rotation_target + 1) or rotation_degrees >= 359:
		rotation_degrees = rotation_target
		is_rotating = false
		set_physics_process(false)
		
		# Notify the player the camera turned
		emit_signal("camera_rotated")
