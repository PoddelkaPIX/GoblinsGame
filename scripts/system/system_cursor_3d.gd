class_name Cursor3D extends Node3D

func _physics_process(delta: float) -> void:
	var cursor_input_dir: Vector2 = Input.get_vector('cursor_left', 'cursor_right', 'cursor_up', 'cursor_down')
	var mouse_pos: Vector2 = get_viewport().get_mouse_position()
	
	mouse_pos += cursor_input_dir * 1500 * delta 
	
	get_viewport().warp_mouse(mouse_pos)

	global_position = _get_mouse_position_3d()

func _get_mouse_position_3d() -> Vector3:
	var dropPlane  = Plane(Vector3(0, 1, 0), 0)
	var mouse_pos = get_viewport().get_mouse_position()
	var camera = get_viewport().get_camera_3d()
	var mouse_pos3D = dropPlane.intersects_ray(
		camera.project_ray_origin(mouse_pos),
		camera.project_ray_normal(mouse_pos)
	)
	if mouse_pos3D:
		return mouse_pos3D
	else:
		return Vector3.ZERO
