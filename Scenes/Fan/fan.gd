extends Area2D

onready var shape_node = get_node("CollisionShape2D")

var wind_force := Vector2(0, -12)

func _ready():
	var _err
	_err = connect("body_entered", self, "on_body_entered")
	_err = connect("body_exited", self, "on_body_exited")


# Give the force of the fan to the player
func on_body_entered(body):
	if body.is_class("Player"):
		body.apply_force(wind_force)


# Give the force of the fan to the player
func on_body_exited(body):
	if body.is_class("Player"):
		body.apply_force(Vector2(0, 0))


