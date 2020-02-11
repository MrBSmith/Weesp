extends Node

var player_node : KinematicBody2D

var velocity := Vector2.ZERO
var destination := Vector2.ZERO
var direction := Vector2.ZERO
var GRAVITY : int = 200
var gravity_modifier : float = 0.0

const SPEED : int = 150


func _physics_process(delta):
	
	# Calculate direction
	if destination != Vector2.ZERO:
		direction = -(player_node.position - destination).normalized()
	
	# Check if the player is already arrived
	var gap = destination - player_node.position
	if gap.abs() < direction * SPEED * delta:
		player_node.position = destination
		direction = Vector2.ZERO
		destination = Vector2.ZERO
	
	# Calculate velocity
	velocity = direction * SPEED
	
	# Apply gravity
	velocity.y += GRAVITY * gravity_modifier
	
	# Move the player
	var _err = player_node.move_and_slide(velocity, Vector2.UP, false, 4, PI/4, false)
