extends Area2D

var level_node : Node = null

func setup():
	var _err = connect("body_entered", self, "on_body_entered")


func on_body_entered(body : PhysicsBody2D):
	if body.is_class("Player"):
		level_node.get_parent().call_deferred("next_level")
