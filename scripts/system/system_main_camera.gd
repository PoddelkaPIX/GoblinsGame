class_name MainCamera extends Camera3D

@export var indent: Vector3 = Vector3(0, 8, 3)

@export var camera_speed = 0.3

@export var is_follow_cursor = true

var _push_dir: Vector3

func _ready() -> void:
	rotation_degrees.x = -75

func _physics_process(_delta):
	_move_to_target_position()
	_camera_raycast_from_earth()
	
func _move_to_target_position() -> void:
	if owner.main_character == null: return
	var target_pos: Vector3 = owner.main_character.global_transform.origin
	if is_follow_cursor:
		var screen_size = DisplayServer.window_get_size()
		var screen_center = Vector2(screen_size.x / 2, screen_size.y / 2)
		var mouse_position = get_viewport().get_mouse_position()
		
		var offset_mouse_from_center = (mouse_position - screen_center)
		
		var multiplier = 0.008
		target_pos.x += offset_mouse_from_center.x * multiplier
		target_pos.z += offset_mouse_from_center.y * multiplier
		
	var dir: Vector3 = global_transform.origin.lerp(target_pos + indent, camera_speed)
	global_transform.origin = dir
	

func _camera_raycast_from_earth():
	var screen_size = get_viewport().get_visible_rect().size
	var screen_center = Vector2(screen_size.x / 2, screen_size.y / 2)
	var start = self.project_ray_origin(screen_center)
	var end = start + self.project_ray_normal(screen_center) * self.get_far()
	var space_state = self.get_world_3d().direct_space_state
	var params = PhysicsRayQueryParameters3D.new()
	params.from = start
	params.to = end
	params.collision_mask = 1
	var result = space_state.intersect_ray(params)
	
	if result:
		return result
	else:
		return {
			"collider": null,  
			"collider_id": null, 
			"normal": Vector3(0, 1, 0), 
			"position": Vector3.ZERO
		}

func push(dir: Vector3):
	_push_dir = dir

func _on_push_state_physics_processing(delta):
	transform.origin = transform.origin.lerp(transform.origin - _push_dir, delta)
	
