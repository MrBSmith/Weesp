extends BaseMove

#### JUMP STATE ####

export var elem_mass : float = 5.0

func update(_host, _delta):
	for i in player_node.get_slide_count():
		var collision = player_node.get_slide_collision(i)
		
		if collision != null:
			var collider = collision.get_collider()
			
			if collider != null:
				# If the collision occurs on a bouncing wall
				if collider.is_class("SlimyWall"):
					bounce(collision)
					
					# Break out of the loop to avoid inverting the velocity multiple time
					break
				
				if collider.is_class("Ice"):
					break
				
				# If the collision occurs with a normal wall
				else:
					return "Glue"


func enter_state(_host):
	if !player_node.is_on_wall():
		physics_node.set_physics_process(true)
		physics_node.mass = elem_mass


# Handle the rebond, depending on the orientation of the wall
func bounce(collision):
	var player_pos = player_node.get_position()
	var collision_pos = collision.get_position()
	
	if collision_pos.y < player_pos.y - 4 or collision_pos.y > player_pos.y + 4:
		physics_node.invert_y_velocity()
	else:
		physics_node.invert_x_velocity()
