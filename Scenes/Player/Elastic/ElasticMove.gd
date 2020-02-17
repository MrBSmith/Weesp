extends BaseMove

#### JUMP STATE ####

export var elem_mass : float = 5.0

func update(_host, _delta):
	for i in player_node.get_slide_count():
		var collision = player_node.get_slide_collision(i)
		
		if collision != null:
			var collider = collision.get_collider()
			# If the collision occurs on a bouncing wall 
			if collider.is_class("BouncingWall"):
				# If the collision is a floor or a ceiling
				if collision.get_position().y <= player_node.get_global_position().y - 4 or collision.get_position().y >= player_node.get_global_position().y + 4:
					physics_node.velocity.y = -physics_node.velocity.y
				# if the collision is a wall
				else:
					physics_node.velocity.x = -physics_node.velocity.x
			# If the collision occurs with a normal wall
			else:
				return "Glue"


func enter_state(_host):
	if !player_node.is_on_wall():
		physics_node.set_physics_process(true)
		physics_node.mass = elem_mass
