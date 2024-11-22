extends Ability

signal moving

@onready var gravity: float = ProjectSettings['physics/3d/default_gravity']

@onready var move_speed: Attribute = attribute_manager.get_attribute('MoveSpeed')
@onready var turn_speed: Attribute = attribute_manager.get_attribute('TurnSpeed')
var is_disabled = false

func move(dir: Vector3, power: int = move_speed.value) -> void:
	if is_disabled: return
	
	if dir != Vector3.ZERO:
		owner.velocity = lerp(owner.velocity, dir * power, get_physics_process_delta_time())
		moving.emit()

func turn(target_position: Vector3): # Поворот вокруг своей оси 
	if is_disabled: return
	
	if turn_speed == null: return
	
	target_position.y = owner.global_transform.origin.y
	if target_position == owner.global_transform.origin: return
	var target_transform = owner.global_transform.looking_at(target_position)
	owner.global_transform = owner.global_transform.interpolate_with(target_transform, turn_speed.value * get_physics_process_delta_time())
	
func friction(delta):
	var h_friction: float = 20.0
	
	if not owner.is_on_floor():
		h_friction /= 10
		
	owner.velocity.x = lerp(owner.velocity.x, 0.0, h_friction * delta)
	owner.velocity.z = lerp(owner.velocity.z, 0.0, h_friction * delta)

func apply_gravity(delta):
	if not owner.is_on_floor():
		owner.velocity.y -= delta * gravity

func push(direction: Vector3):
	owner.velocity += get_physics_process_delta_time() * direction
