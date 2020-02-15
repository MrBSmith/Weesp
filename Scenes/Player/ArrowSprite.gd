extends Sprite

func _ready():
	set_visible(false)

# Called when one wants to activate/desactivate the arrow
func set_activate(value: bool):
	set_visible(value)
