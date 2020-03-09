extends BaseMove

#### JUMP STATE ####

export var elem_mass : float = 5.0
var is_bouncing : bool = false

func update(_host, _delta):
	if player_node.is_on_wall() == false:
		is_bouncing = false
	
	# Glue the character if he stopped boucing
	if player_node.is_on_wall() && physics_node.velocity == Vector2.ZERO:
		return "Glue"
	
	
	for i in player_node.get_slide_count():
		var collision = player_node.get_slide_collision(i)
		
		if collision != null:
			var collider = collision.get_collider()
			
			if collider != null:
				# If the collision occurs on a bouncing wall
				if collider.is_class("SlimyWall"):
					if is_bouncing == false :
						bounce(collision)
					
					# Break out of the loop to avoid inverting the velocity multiple time
					break
				
				elif collider.is_class("Ice"):
					break
					
				# If the collision occurs with a normal wall
				else:
					return "Glue"



func enter_state(_host):
	if !player_node.is_on_wall():
		physics_node.set_physics_process(true)
		physics_node.mass = elem_mass


func exit_state(_host):
	is_bouncing = false
	

# Handle the rebond, depending on the orientation of the wall
func bounce(collision):
	var player_pos = player_node.get_position()
	var collision_pos = collision.get_position()
	
	if collision_pos.y < player_pos.y - 3 or collision_pos.y > player_pos.y + 3:
		physics_node.invert_y_velocity()
		is_bouncing = true
	elif collision_pos.x < player_pos.x - 3 or collision_pos.x > player_pos.x + 3:
		physics_node.invert_x_velocity()
		is_bouncing = true

