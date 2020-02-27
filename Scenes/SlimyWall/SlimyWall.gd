extends StaticBody2D

class_name SlimyWall

func _ready():
	pass # Replace with function body.

func is_class(value: String):
	return value == "SlimyWall"

func get_class() -> String:
	return "SlimyWall"
