extends KinematicBody2D

#Define an array of all children of player
onready var children_array = get_children()
onready var state_machine_node = get_node("StateMachine")

export var speed : float
var dest := Vector2(0,0)
var dir := Vector2(0,0)
var gap := Vector2(0,0)

func _ready():
	for child in children_array:
		if ("player_node" in child):
			child.player_node = self
	state_machine_node.on_ready()
	

func player_click_movement(delta):
	if position != dest:
		gap = dest - position
		dir = gap.normalized()
		var _moveplayer = move_and_slide(dir * speed)
		if gap.abs() < dir * speed * delta:
			position = dest