extends Node

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed('jump') and owner.is_on_floor():
		owner.fsm.send_event('jump')

func _on_jump_state_entered() -> void:
	var move_input_dir = Input.get_vector('move_left', 'move_right', 'move_up', 'move_down')
	var character: Character = owner
	var move_speed: Attribute = character.attribute_manager.get_attribute('MoveSpeed')
	move_input_dir *= move_speed.value * 1.5
	owner.movement.push(Vector3(move_input_dir.x, 300, move_input_dir.y))

func _on_jump_state_exited() -> void:
	pass # Replace with function body.
