extends Label

onready var camera_node = get_parent().get_parent()

func _ready():
	set_visible(false)
	set_process(false)

func _input(_event):
	if Input.is_action_pressed("ui_cancel"):
		set_visible(!is_visible())
		set_process(is_visible())

func _process(_delta):
	text = "Target degree: " + String(camera_node.rotation_target)
