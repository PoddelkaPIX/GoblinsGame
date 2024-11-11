extends Node

@onready var agent = owner

func _physics_process(_delta: float) -> void:
	var move_input_dir = Input.get_vector('move_left', 'move_right', 'move_up', 'move_down')
	if owner.fsm.get_expression_property('is_action') == true: return

	if move_input_dir == Vector2.ZERO: return
	if not agent.is_on_floor(): return
	agent.fsm.send_event('move')

func _on_move_state_physics_processing(_delta: float) -> void:
	var move_input_dir = Input.get_vector('move_left', 'move_right', 'move_up', 'move_down')
	owner.movement.move(Vector3(move_input_dir.x, 0, move_input_dir.y))
	_turn_to_cursor()
	_determine_animation_direction()

func _turn_to_cursor():
	var position = get_tree().current_scene.cursor_3d.global_position
	get_tree().current_scene.main_character.movement.turn(position)

func _determine_animation_direction():
	var velocity = agent.velocity
	if agent is Character:
		var basis = agent.transform.basis.z
		var angle = Vector2(basis.x, basis.z).angle()
		
		# FIXME Если персонаж смотрит вправо, то анимации отображаются не верно
		var animation_vector = Vector2(
			-(velocity.x * cos(angle)) + (-velocity.x * -sin(angle)), 
			velocity.z * sin(angle) + velocity.x * cos(angle)
		)
		
		agent.animation_tree['parameters/move/blend_position'] = animation_vector
