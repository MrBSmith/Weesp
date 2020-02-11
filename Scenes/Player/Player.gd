extends KinematicBody2D

#Define an array of all children of player
onready var children_array = get_children()
onready var state_machine_node = get_node("StateMachine")
onready var physics_node = get_node("Physics")

const GRAVITY := 200.0
var dir_gravity := Vector2(0,1)

export var speed : float
var gap := Vector2(0,0)

func _ready():
	for child in children_array:
		if "player_node" in child:
			child.player_node = self
		
		if "physics_node" in child:
			child.physics_node = physics_node
		
	state_machine_node.setup()


#func player_click_movement(delta):
#	if position != dest:
#		gap = dest - position
#		dir = gap.normalized()
#		var _moveplayer = move_and_slide(dir * speed)
#		if gap.abs() < dir * speed * delta:
#			position = dest
